/*
	Author: original by Vampire, completely rewritten by IT07

	Description:
	spawns AI using given _pos and unit/group count.

	Params:
	_this select 0: POSITION - where to spawn the units around
	_this select 1: SCALAR - how many groups to spawn
	_this select 2: SCALAR - how many units to put in each group
	_this select 3: SCALAR - AI mode
	_this select 4: STRING - exact config name of mission
	_this select 5: SCALAR (optional) - maximum spawn distance from center

	Returns:
	ARRAY format [[groups],[50cals]]
*/

private ["_spawned","_pos","_grpCount","_unitsPerGrp","_mode","_missionName","_maxRange"];
_spawned = [[],[]];
params [["_pos",[],[[]]], ["_grpCount",1,[0]], ["_unitsPerGrp",1,[0]], ["_mode",-1,[0]], ["_missionName","",[""]], ["_maxRange",175,[0]]];
if ((count _pos isEqualTo 3) AND (_grpCount > 0) AND (_unitsPerGrp > 0) AND (_missionName in ("missionList" call VEMFr_fnc_getSetting))) then
	{
		private [
			"_sldrClass","_groups","_hc","_aiDifficulty","_skills","_accuracy","_aimShake","_aimSpeed","_stamina","_spotDist","_spotTime",
			"_courage","_reloadSpd","_commanding","_general","_houses","_notTheseHouses","_goodHouses","_noHouses","_cal50s","_units"
		];
		_sldrClass = "unitClass" call VEMFr_fnc_getSetting;
		_groups = [];
		_hc = "headLessClientSupport" call VEMFr_fnc_getSetting;
		_aiDifficulty = [["aiSkill"],["difficulty"]] call VEMFr_fnc_getSetting param [0, "Veteran", [""]];
		_skills = [["aiSkill", _aiDifficulty],["accuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"]] call VEMFr_fnc_getSetting;
		_skills params ["_accuracy","_aimShake","_aimSpeed","_stamina","_spotDist","_spotTime","_courage","_reloadSpd","_commanding","_general"];
		_houses = nearestTerrainObjects [_pos, ["House"], _maxRange]; // Find some houses to spawn in
		_notTheseHouses = "housesBlackList" call VEMFr_fnc_getSetting;
		_goodHouses = [];
		{ // Filter the houses that are too small for one group
			if not(typeOf _x in _notTheseHouses) then
				{
					if ([_x, _unitsPerGrp] call BIS_fnc_isBuildingEnterable) then
						{
							_goodHouses pushBack _x;
						};
				};
		} forEach _houses;
		_goodHouses = _goodHouses call BIS_fnc_arrayShuffle;
		_noHouses = false;
		if (count _goodHouses < _grpCount) then
			{
				_noHouses = true;
			};
		_cal50s = [["DynamicLocationInvasion"],["cal50s"]] call VEMFr_fnc_getSetting param [0, 3, [0]];
		if (_cal50s > 0) then
			{
				_cal50sVehs = [];
			};
		_units = []; // Define units array. the for loops below will fill it with units
		for "_g" from 1 to _grpCount do // Spawn Groups near Position
			{
				if not _noHouses then
					{
						if (count _goodHouses < 1) then
							{
								_noHouses = true
							};
					};
				private ["_groupSide"];
				_groupSide = ("unitClass" call VEMFr_fnc_getSetting) call VEMFr_fnc_checkSide;
				if not isNil "_groupSide" then
					{
						private ["_grp"];
						_grp = createGroup _groupSide;
						(_spawned select 0) pushBack _grp;
						_grp allowFleeing 0;
						private ["_house","_housePositions"];
						if not _noHouses then
							{
								_house = selectRandom _goodHouses;
								_houseID = _goodHouses find _house;
								_goodHouses deleteAt _houseID;
								_housePositions = [_house] call BIS_fnc_buildingPositions;
							};
						private ["_placed50"];
						_placed50 = false;
						for "_u" from 1 to _unitsPerGrp do
							{
								private ["_spawnPos","_hmg"];
								if _noHouses then
									{
										_spawnPos = [_pos,20,_maxRange,1,0,200,0] call BIS_fnc_findSafePos; // Find Nearby Position
									} else
									{
										_spawnPos = selectRandom _housePositions;
										if not _placed50 then
											{
												_placed50 = true;
												if (_cal50s > 0) then
													{
														_hmg = createVehicle ["O_HMG_01_high_F", _spawnPos, [], 0, "CAN_COLLIDE"];
														_hmg setVehicleLock "LOCKEDPLAYER";
														(_spawned select 1) pushBack _hmg;
													};
											};
									};
								private ["_unit"];
								_unit = _grp createUnit [_sldrClass, _spawnPos, [], 0, "CAN_COLLIDE"]; // Create Unit There
								if not _noHouses then
									{
										//doStop _unit;
										if (_cal50s > 0) then
											{
												if not isNil "_hmg" then
													{
														if not isNull _hmg then
															{
																_unit moveInGunner _hmg;
																_hmg = nil;
																_cal50s = _cal50s - 1;
															};
													};
											};
										private ["_houseIndex"];
										_houseIndex = _housePositions find _spawnPos;
										_housePositions deleteAt _houseIndex;
									};

								_unit addMPEventHandler ["mpkilled","if (isDedicated) then { [_this select 0, _this select 1] ExecVM 'exile_vemf_reloaded\sqf\aiKilled.sqf' }"];

								// Set skills
								_unit setSkill ["aimingAccuracy", _accuracy];
								_unit setSkill ["aimingShake", _aimShake];
								_unit setSkill ["aimingSpeed", _aimSpeed];
								_unit setSkill ["endurance", _stamina];
								_unit setSkill ["spotDistance", _spotDist];
								_unit setSkill ["spotTime", _spotTime];
								_unit setSkill ["courage", _courage];
								_unit setSkill ["reloadSpeed", _reloadSpd];
								_unit setSkill ["commanding", _commanding];
								_unit setSkill ["general", _general];

								_unit enableAI "TARGET";
								_unit enableAI "AUTOTARGET";
								_unit enableAI "MOVE";
								_unit enableAI "ANIM";
								_unit enableAI "TEAMSWITCH";
								_unit enableAI "FSM";
								_unit enableAI "AIMINGERROR";
								_unit enableAI "SUPPRESSION";
								_unit enableAI "CHECKVISIBLE";
								_unit enableAI "COVER";
								_unit enableAI "AUTOCOMBAT";
								_unit enableAI "PATH";
							};
						private ["_invLoaded"];
						_invLoaded = [units _grp, _missionName, _mode] call VEMFr_fnc_loadInv; // Load the AI's inventory
						if not _invLoaded then
							{
								["fn_spawnInvasionAI", 0, "failed to load AI's inventory..."] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
							};
						_groups pushBack _grp; // Push it into the _groups array
					};
			};

		if (count _groups isEqualTo _grpCount) then
			{
				if _noHouses then
					{
						private ["_waypoints"];
						_waypoints = [
							[(_pos select 0), (_pos select 1)+50, 0],
							[(_pos select 0)+50, (_pos select 1), 0],
							[(_pos select 0), (_pos select 1)-50, 0],
							[(_pos select 0)-50, (_pos select 1), 0]
						];
						{ // Make them Patrol
							for "_z" from 1 to (count _waypoints) do
								{
									private ["_wp"];
									_wp = _x addWaypoint [(_waypoints select (_z-1)), 10];
									_wp setWaypointType "SAD";
									_wp setWaypointCompletionRadius 20;
								};
							private ["_cyc"];
							_cyc = _x addWaypoint [_pos,10];
							_cyc setWaypointType "CYCLE";
							_cyc setWaypointCompletionRadius 20;
						} forEach _groups;
					};
			};
	} else
	{
		["spawnInvasionAI", 0, format["params are not valid! [%1,%2,%3,%4]", count _pos isEqualTo 3, _grpCount > 0, _unitsPerGrp > 0, _missionName in ("missionList" call VEMFr_fnc_getSetting)]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
	};

_spawned
