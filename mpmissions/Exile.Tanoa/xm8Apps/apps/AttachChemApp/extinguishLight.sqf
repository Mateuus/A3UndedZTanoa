_extinguish = _this select 2;
_chemlight = _this select 3;

player playMove "AinvPknlMstpSnonWnonDr_medic3";

sleep 10;

deleteVehicle _chemlight;
player removeAction _extinguish;