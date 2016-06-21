if !((vehicle player) isEqualTo player) exitWith {}; //MAKE SURE WE ARE ON FEET

if (typeOf cursorTarget == "Exile_Bike_MountainBike") then {
    deletevehicle cursorTarget;
    player playMove "AinvPknlMstpSnonWnonDr_medic3";
    player addweapon "ItemRadio";
	uiSleep 1;
    ["Success",["Personal Bike packed! Radio added!"]] call ExileClient_gui_notification_event_addNotification;
};