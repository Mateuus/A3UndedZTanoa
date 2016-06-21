/*
	Author: IT07

	Description:
	launches VEMFr (You don't say?)
*/

if isNil "VEMFrHasStarted" then
	{
		VEMFrHasStarted = call compileFinal "true";
		["Launcher", 2, format["/// STARTING VEMFr v%1 \\\", getText (configFile >> "CfgPatches" >> "exile_vemf_reloaded" >> "version")]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
		uiNamespace setVariable ["VEMFrUsedLocs", []];
		uiNamespace setVariable ["VEMFrAttackedFlags", []];
		uiNamespace setVariable ["VEMFrHcLoad", []];

		[] spawn
			{
				if ("overridesToRPT" call VEMFr_fnc_getSetting isEqualTo 1) then
					{
						_root = configProperties [configFile >> "CfgVemfReloadedOverrides", "true", false];
						{
							if (isClass _x) then
								{
									_classLv1Name = configName _x;
									_levelOne = configProperties [configFile >> "CfgVemfReloadedOverrides" >> _classLv1Name, "true", false];
									{
										if (isClass _x) then
											{
												_classLv2Name = configName _x;
												_levelTwo = configProperties [configFile >> "CfgVemfReloadedOverrides" >> _classLv1Name >> _classLv2Name, "true", false];
												{
													if not(isClass _x) then
														{
															["overridesToRPT", 1, format["Overriding 'CfgVemfReloaded >> %1 >> %2 >> %3'", _classLv1Name, _classLv2Name, configName _x]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
														};
												} forEach _levelTwo;
											} else
											{
												["overridesToRPT", 1, format["Overriding 'CfgVemfReloaded >> %1 >> %2", _classLv1Name, configName _x]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
											};
									} forEach _levelOne;
								} else
								{
									["overridesToRPT", 1, format["Overriding 'CfgVemfReloaded >> %1'", configName _x]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
								};
						} forEach _root;
					};

				_scripts = ["checkLoot","missionTimer","REMOTEguard","spawnStaticAI"];
				{
					ExecVM format["exile_vemf_reloaded\sqf\%1.sqf", _x];
				} forEach _scripts;

				west setFriend [independent, 0];
				independent setFriend [west, 0];
			};
	} else
	{
		["Launcher", 0, format["exile_vemf_reloaded FAILED to launch! VEMFrHasStarted (%1) is already defined!", VEMFrHasStarted]] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
	};
