if !((vehicle player) isEqualTo player) exitWith {};

if ("ItemRadio" in assignedItems player + items player) then
{
		titleText ["", "PLAIN DOWN"];	
		player removeAction DeployBikeAction;
		player removeweapon "ItemRadio";
		player playActionNow "Medic";
		_spawnPos = player modelToWorld [0,10,0];
		_spawnDir = (getDir player) -90;
		do_MakeBike = [player, _spawnPos, _spawnDir];
		uiSleep 3;
		publicVariableServer "do_MakeBike";
		uiSleep 1;
		["<t size = '.8'>Bike Deployed - Radio used</t>",0,0,2,0.5] spawn bis_fnc_dynamictext;
		systemchat("Bike deployed");
}
else
{
	["<t size = '.8'>Deploying a bike requires a Radio</t>",0,0,2,0.5] spawn bis_fnc_dynamictext;
	systemchat("Deploying a bike requires a Radio");
};
};