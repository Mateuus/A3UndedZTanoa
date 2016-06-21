/*
	VEMF AI Killed by Vampire, rewritten by IT07

	Description:
	executed upon AI unit death

	Params:
	_this: ARRAY
	_this select 0: OBJECT - the killed AI
	_this select 1: OBJECT - killer

	Returns:
	nothing
*/

params [["_target",objNull,[objNull]], ["_killer",objNull,[objNull]]];
if (isPlayer _killer) then
	{
		if (_killer isKindOf "Man") then // Roadkill or regular kill
			{
				if (vehicle _killer isEqualTo _killer) then // If on foot
					{
						if (vehicle _target isEqualTo _target) then
							{
								if (("respectReward" call VEMFr_fnc_getSetting) > 0) then
								   {
										[_target, _killer] ExecVM "exile_vemf_reloaded\sqf\handleRespectGain.sqf";
									};
								[_target, _killer] ExecVM "exile_vemf_reloaded\sqf\sayKilledWeapon.sqf";
							} else
							{
								if (typeOf (vehicle _target) isEqualTo "Steerable_Parachute_F") then
									{
										if ("logCowardKills" call VEMFr_fnc_getSetting isEqualTo 1) then
											{
												["fn_aiKilled", 1, format["A coward (%1 @ %2) killed a parachuting AI", name _killer, mapGridPosition _killer]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
											};
									} else
									{
										if (("respectReward" call VEMFr_fnc_getSetting) > 0) then
										   {
												[_target, _killer] ExecVM "exile_vemf_reloaded\sqf\handleRespectGain.sqf";
											};
										[_target, _killer] ExecVM "exile_vemf_reloaded\sqf\sayKilledWeapon.sqf";
									};
							};
					} else // If in vehicle (a.k.a. roadkill)
					{
						if (("punishRoadKills" call VEMFr_fnc_getSetting) isEqualTo 1) then
							{
								_respectDeduct = "respectRoadKillDeduct" call VEMFr_fnc_getSetting;
								_curRespect = _killer getVariable ["ExileScore", 0];
								//diag_log text format["_curRespect of _killer (%1) is %2", _killer, _curRespect];
								_newRespect = _curRespect - _respectDeduct;
								_killer setVariable ["ExileScore", _newRespect];
								ExileClientPlayerScore = _newRespect;
								(owner _killer) publicVariableClient "ExileClientPlayerScore";
								ExileClientPlayerScore = nil;
								[_killer, "showFragRequest", [[["ROADKILL..."],["Respect Penalty:", -_respectDeduct]]]] call ExileServer_system_network_send_to;
								format["setAccountMoneyAndRespect:%1:%2:%3", _killer getVariable ["ExileMoney", 0], _newRespect, (getPlayerUID _killer)] call ExileServer_system_database_query_fireAndForget;

								if (("sayKilled" call VEMFr_fnc_getSetting) isEqualTo 1) then
									{
										[format["(VEMFr) %1 [Roadkill] AI", name _killer]] ExecVM "exile_vemf_reloaded\sqf\systemChatToClient.sqf";
									};
							};
					};
			} else // If kill from vehicle (NOT a roadkill)
			{
				if (typeOf (vehicle _target) isEqualTo "Steerable_Parachute_F") then
					{
						if ("logCowardKills" call VEMFr_fnc_getSetting isEqualTo 1) then
							{
								["fn_aiKilled", 1, format["A coward (%1 @ %2) killed a parachuting AI", name _killer, mapGridPosition _killer]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
							};
					} else
					{
						_killer = effectiveCommander _killer;
						if (("respectReward" call VEMFr_fnc_getSetting) > 0) then
							{
								[_target, _killer] ExecVM "exile_vemf_reloaded\sqf\handleRespectGain.sqf";
							};
						[_target, _killer] ExecVM "exile_vemf_reloaded\sqf\sayKilledWeapon.sqf";
					};
			};
	};

	_settings = [["aiCleanup"],["removeLaunchers","aiDeathRemovalEffect","removeHeadGear"]] call VEMFr_fnc_getSetting;
	_removeLaunchers = _settings select 0;
	if (_removeLaunchers isEqualTo 1) then
		{
			_secWeapon = secondaryWeapon _target;
			if not(_secWeapon isEqualTo "") then
				{
					_target removeWeaponGlobal _secWeapon;
					_missiles = getArray (configFile >> "cfgWeapons" >> _secWeapon >> "magazines");
					{
						if (_x in _missiles) then
							{
								_target removeMagazineGlobal _x;
							};
					} forEach (magazines _target);
				};
		};
	if (_settings select 2 isEqualTo 1) then // If removeHeadGear setting is enabled
		{
			removeHeadGear _target;
		};

	if (_settings select 1 isEqualTo 1) then // If killEffect enabled
		{
			playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", _target, false, getPosASL _target, 2, 1, 60];
			for "_u" from 1 to 12 do
			{
				if not(isObjectHidden _target) then
				{
					_target hideObjectGlobal true;
				} else
				{
					_target hideObjectGlobal false;
				};
				uiSleep 0.12;
			};
			_target hideObjectGlobal true;
			removeAllWeapons _target;
			// Automatic cleanup yaaay
			deleteVehicle _target;
		};

		_target removeAllEventHandlers "MPKilled";
