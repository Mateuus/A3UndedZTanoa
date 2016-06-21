private ["_objs"];
_objs = [
	["Land_FuelStation_02_workshop_F",[2303.61,13450.2,0.460684],1.36365,[[0.0237979,0.999717,0],[0,0,1]],false],
	["Land_FuelStation_Feed_F",[2302.78,13439.3,0],3.18183,[[0.0555048,0.998458,0],[0,0,1]],false],
	["Land_fs_sign_F",[2308.48,13446.4,0],0,[[0,1,0],[0,0,1]],false]
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