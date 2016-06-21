private ["_light","_extinguish"];

_chemlights = ["Chemlight_green","Chemlight_yellow","Chemlight_red","Chemlight_blue"];

_items = magazines player;
_availChems = _items arrayIntersect _chemlights;

if (count _availChems == 0) then {hint "No chemlights";} else
{
	_chem = _availChems call BIS_fnc_selectRandom;

	_chemColour = [1.0, 0.0, 0.0];

	if (_chem == "Chemlight_red") then {_chemColour = [1.0, 0.0, 0.0];};
	if (_chem == "Chemlight_green") then {_chemColour = [0.0, 1.0, 0.0];};
	if (_chem == "Chemlight_blue") then {_chemColour = [0.0, 0.0, 1.0];};
	if (_chem == "Chemlight_yellow") then {_chemColour = [0.5, 0.5, 0.0];};	

	player removeItem _chem;

	_pos = position player;
	_obj = player;

	player playMove "AinvPknlMstpSnonWnonDr_medic3";

	sleep 10;

	_light = createVehicle ["#lightpoint", getPos _obj, [], 0, "NONE"];
	_light lightAttachObject [player, [0.0,0.0,-2.5]];
	_light setLightBrightness 0.5;
	_light setLightAmbient _chemColour;
	_light setLightColor _chemColour;

	_extinguish = player addAction ["Extinguish Chemlight","extinguishLight.sqf",_light,0,false];

	
};
uiSleep 720;
deleteVehicle _light;
player removeAction _extinguish;