private ["_objs"];
_objs = [
	["Land_FuelStation_02_workshop_F",[7003.22,7370.41,0],81.8181,[[0.989821,0.142316,0],[0,0,1]],false],
	["Land_fs_feed_F",[6991.81,7369.94,-2.0338],0,[[0,1,0],[0,0,1]],false],
	["Land_fs_feed_F",[6993.65,7369.15,0],82.2727,[[0.990919,0.134458,0],[0,0,1]],false],
	["Land_Airport_02_sign_aeroport_F",[7000.75,7369.96,5.37718],81.8181,[[0.989821,0.142316,0],[0,0,1]],false]
];

{
	private ["_obj"];
	_obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
	if (_x select 4) then {
		_obj setDir (_x select 2);
		_obj setPos (_x select 1);
	} else {
		_obj setPosATL (_x select 1);
		_obj setVectorDirAndUp (_x select 3);
	};
} foreach _objs;