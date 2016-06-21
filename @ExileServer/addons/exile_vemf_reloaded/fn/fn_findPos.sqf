/*
	Author: IT07

	Description:
	can find a location or pos randomly on the map where there are no players

	Params:
	_this select 0: STRING - Mode to use. Options: "loc" or "pos"
	_this select 1: BOOLEAN - True if _pos needs to be a road
	_this select 2: POSITION - Center for nearestLocations check
	_this select 3: SCALAR - Distance in meters. Locations closer than that will be excluded
	_this select 4: SCALAR - Max prefered distance in meters from center. If not achievable, further dest will be selected
	_this select 5: SCALAR - Distance in meters to check from _cntr for players
	_this select 6: STRING (optional) - Exact config name of mission override settings to load

	Returns:
	if mode = loc: LOCATION
	if mode = pos: POSITION
*/

private ["_ret","_settings","_nonPopulated","_blackPos","_missionDistance","_mode","_onRoad","_cntr","_tooCloseRange","_maxPrefered","_skipDistance","_range","_missionConfigName"];
_ret = false;
// Define settings
_settings = [["nonPopulated","noMissionPos","missionDistance"]] call VEMFr_fnc_getSetting;
_settings params [["_nonPopulated",1,[0]], ["_blackPos",[],[[]]], ["_missionDistance",3000,[0]]];
params [["_mode","",[""]], ["_onRoad",false,[false]], ["_cntr",[],[[]]], ["_tooCloseRange",-1,[0]], ["_maxPrefered",-1,[0]], ["_skipDistance",-1,[0]], ["_missionConfigName","",[""]]];
_range = worldSize;
if not(_missionConfigName isEqualTo "") then
	{
		private ["_nonPopulatedOverride"];
		_nonPopulatedOverride = ([[_missionConfigName],["nonPopulated"]] call VEMFr_fnc_getSetting) select 0;
		if not isNil "_nonPopulatedOverride" then
			{
				if not(_nonPopulatedOverride isEqualTo -1) then
					{
						_nonPopulated = _nonPopulatedOverride;
					};
			};
	};

private ["_checkBlackPos"];
_checkBlackPos = false;
if (count _blackPos > 0) then
	{
		_checkBlackPos = true;
	};

private ["_mode","_roadRange"];
if (not(_mode isEqualTo "") AND (_cntr isEqualTypeArray [0,0,0]) AND (_tooCloseRange > -1) AND (_maxPrefered > -1)) then
	{
		_roadRange = 5000;
		if (_mode isEqualTo "loc") then
			{
				// Get a list of locations close to _cntr (position of player)
				private ["_locs"];
				_locs = nearestLocations [_cntr, ["CityCenter","Strategic","StrongpointArea","NameVillage","NameCity","NameCityCapital",if(_nonPopulated isEqualTo 1)then{"nameLocal","Area","BorderCrossing","Hill","fakeTown","Name","RockArea","ViewPoint"}], _range];
				if (count _locs > 0) then
					{
						private ["_usedLocs","_remLocs","_blackListMapClasses","_listedMaps"];
						_usedLocs = uiNamespace getVariable "VEMFrUsedLocs";
						_remLocs = [];
						_blackListMapClasses = "true" configClasses (configFile >> "CfgVemfReloaded" >> "locationBlackLists");
						_listedMaps = []; // Define
						{ // Make a list of locationBlackLists's children
							_listedMaps pushBack (configName _x);
						} forEach _blackListMapClasses;
						private ["_blackList"];
						if (worldName in _listedMaps) then { _blackList = ([["locationBlackLists", worldName],["locations"]] call VEMFr_fnc_getSetting) select 0 }
						else { _blackList = ([["locationBlackLists","Other"],["locations"]] call VEMFr_fnc_getSetting) select 0 };

						{ // Check _locs for invalid locations (too close, hasPlayers or inBlacklist)
							private ["_hasPlayers"];
							_hasPlayers = [locationPosition _x, _skipDistance] call VEMFr_fnc_checkPlayerPresence;
							if _hasPlayers then
								{
									_remLocs pushBack _x;
								} else
								{
									if _checkBlackPos then
										{
											private ["_locPos","_loc"];
											_locPos = locationPosition _x;
											_loc = _x;
											{
												if (count _x isEqualTo 2) then
													{
														private ["_pos"];
														_pos = _x param [0, [0,0,0], [[]]];
														if not(_pos isEqualTo [0,0,0]) then
															{
																private ["_range"];
																_range = _x param [1, 600, [0]];
																if ((_pos distance _locPos) < _range) then
																	{
																		_remLocs pushBack _loc;
																	};
															};
													} else
													{
														["fn_findPos", 0, format["found invalid entry in mission blacklist: %1", _x]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
													};
											} forEach _blackPos;
										};
										if ((text _x) in _blackList) then
											{
												_remLocs pushBack _x;
											} else
											{
												if (_cntr distance (locationPosition _x) < _tooCloseRange) then
													{
														_remLocs pushBack _x;
													} else
													{
														if (_x in _usedLocs) then
															{
																_remLocs pushBack _x;
															};
													};
											};
											if (count _usedLocs > 0) then
												{
													private ["_loc"];
													_loc = _x;
													{
														if (((locationPosition _loc) distance (locationPosition _x)) < _missionDistance) then
															{
																_remLocs pushBack _loc;
															};
													} forEach _usedLocs;
												};
								};
						} forEach _locs;

						private ["_index"];
						{ // Remove all invalid locations from _locs
							_index = _locs find _x;
							_locs deleteAt _index;
						} forEach _remLocs;

						private ["_far","_pref","_dist"];
						// Check what kind of distances we have
						_far = []; // Further than _maxPrefered
						_pref = []; // Closer then _maxPrefered
						{
							_dist = _cntr distance (locationPosition _x);
							if (_dist > _maxPrefered) then
								{
									_far pushBack _x;
								};
							if (_dist < _maxPrefered) then
								{
									_pref pushBack _x;
								};
						} forEach _locs;

						// Check if there are any prefered locations. If yes, randomly select one
						private ["_loc"];
						if (count _pref > 0) then
							{
								_loc = selectRandom _pref;
							};

						// Check if _far has any locations and if _pref is empty
						if (count _far > 0) then
							{
								if (count _pref isEqualTo 0) then
									{
										_loc = selectRandom _far;
									};
							};

						// Validate _locs just to prevent the .RPT from getting spammed
						if (count _locs > 0) then
							{
								// Return Name and POS
								_ret = _loc;
								(uiNamespace getVariable "VEMFrUsedLocs") pushBack _loc;
							};
					};
			};
		if (_mode isEqualTo "pos") then
			{
				private ["_valid"];
				_valid = false;
				for "_p" from 1 to 10 do
					{
						if (_ret isEqualType true) then
							{
								if not _ret then
									{
										private ["_pos"];
										_pos = [_cntr, _tooCloseRange, -1, 2, 0, 50, 0] call BIS_fnc_findSafePos;
										if _onRoad then
											{
												private ["_roads"];
												_roads = _pos nearRoads _roadRange;
												if (count _roads > 0) then
													{
														private ["_closest","_dist"];
														_closest = ["", _roadRange];
														{ // Find the closest road
															_dist = _x distance _pos;
															if (_dist < (_closest select 1)) then
																{
																	_closest = [_x, _dist];
																};
														} forEach _roads;
														_pos = position (_closest select 0);
													};
											};
										if not([_pos, _skipDistance] call VEMFr_fnc_checkPlayerPresence) then
											{
												_ret = _pos;
											};
									};
							};
					};
			};
	} else
	{
		["findPos",0,"params not valid!"] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
	};

_ret
