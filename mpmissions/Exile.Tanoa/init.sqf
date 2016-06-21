
//{_x setMarkerAlphaLocal 100} foreach [

//];

[] execVM "Custom\EnigmaRevive\init.sqf";
[] execVM "R3F_LOG\init.sqf";
[] execVM "watercrate.sqf";
[] execVM "airpatrol.sqf";
[] execVM "custom\money\takegive_poptab_init.sqf";
[] execVm "xm8Apps\ExileSecurity\Init.sqf";
[] execVM "Custom\APOC_Airdrop_Assistance\init.sqf"; //Airdrop System
execVM "VirtualGarage\VirtualGarage_Client_Init.sqf";

ETG_Cargo_Drop_Mission = 0;
_nul = execVM "ETG_HeliCrashAndDropScript.sqf";

#include "A3XAI_Client\A3XAI_initclient.sqf";
#include "custom\watermark\logo.sqf"

//Pets
BURK_dogSeek = compileFinal preprocessFileLineNumbers "johnO_fnc_seeking.sqf";
BURK_dogFollowPlayer = compileFinal preprocessFileLineNumbers "johnO_fnc_following.sqf";
BURK_dogMoveToPos = compileFinal preprocessFileLineNumbers "johnO_fnc_moveToPos.sqf";

//Repair Script
JohnO_fnc_repairWheels = compileFinal preprocessFileLineNumbers "JohnO_fnc_repairWheels.sqf";
JohnO_fnc_repairchopper = compileFinal preprocessFileLineNumbers "JohnO_fnc_repairchopper.sqf";
JohnO_fnc_repairchopperhalf = compileFinal preprocessFileLineNumbers "JohnO_fnc_repairchopperhalf.sqf";
JohnO_fnc_vehicleRepairCar = compile preprocessFileLineNumbers "JohnO_fnc_vehicleRepairCar.sqf";
Onefox_fnc_salvageWheels = compileFinal preprocessFileLineNumbers "Onefox_fnc_salvageWheels.sqf";


if(hasInterface) then{

[] execVM "custom\service\service_point.sqf";
[] ExecVM "VEMFr_client\sqf\initClient.sqf"; // Client-side part of VEMFr
	
};

if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "LSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "LSpawner\LSdeleter.sqf";
	execVM "LSpawner\Lootspawner.sqf";
	[] execVM "Custom\timeMultiplier\timeMultiplier.sqf";
};


if (isDedicated || isServer) then  
{
	"do_MakeBike" addPublicVariableEventHandler 
	{
		_parameters = (_this select 1);
		_parameters2  =(_parameters select 1);
		diag_log format ["createVehicleRequested %1 ", _parameters];
		veh = createVehicle["Exile_Bike_MountainBike", _parameters2 , [] ,0 , "NONE"];
	};
};