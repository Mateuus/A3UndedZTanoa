setTimeMultiplier 3;
[] execVM "custom\logo.sqf";
[] execVM "addons\statusBar\statusbar.sqf";
[] execVM "custom\zcp.sqf";
[] execVM "custom\EnigmaPersonalVehicle\init.sqf";
[] execVM "custom\EnigmaRevive\init.sqf";

if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "LSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "LSpawner\LSdeleter.sqf";
	execVM "LSpawner\Lootspawner.sqf";
};




