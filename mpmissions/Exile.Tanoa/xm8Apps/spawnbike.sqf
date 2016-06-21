-if ("ItemCompass" in assignedItems player) then
{
	player unlinkItem "Exile_Item_DuctTape";
	player removeAction DeployBike;
	player playMove "Acts_carFixingWheel";
	sleep 12;
	_posplr = [((getPosAtl player) select 0) + 2, ((getPosAtl player) select 1) + 2, 0];
	_vehicle = createVehicle ["Exile_Bike_QuadBike_Black", _posplr, [], 0, "NONE"];
	_vehicle setDir (getDir player);
	["Success",["You spawned your bike!"]] call ExileClient_gui_notification_event_addNotification;
}
else
{
	//Just in case.
	player removeAction DeployBike;
	["Error",["Somthing went wrong!"]] call ExileClient_gui_notification_event_addNotification;
};