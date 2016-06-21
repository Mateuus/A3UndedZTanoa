_objects = 
[

	//Boat Traders///////////////////////////////////////////
	
	["Land_Sunshade_04_F",[8933.91,4774.42,0.528023],[[0,0.995168,-0.0981901],[-0.106065,0.0976363,0.989554]],[false,false]],
	["Exile_Sign_Boat_Small",[8931.89,4773.14,0.457537],[[-0.684473,0.729038,0],[0,0,1]],[false,false]],
	["Land_Sunshade_02_F",[5674.37,3930.42,1.37844],[[0,1,0],[0,0,1]],[false,false]],
	["Exile_Sign_Boat",[5675.7,3928.93,1.37844],[[0.205282,-0.978703,0],[0,0,1]],[false,false]],
	["Land_BagFence_End_F",[5674.36,3930.18,1.37844],[[0.999781,-0.0209101,0],[0,0,1]],[false,false]],
	["Exile_Sign_Boat",[2225.78,8652.21,1.30592],[[0,1,0],[0,0,1]],[false,false]],
	["Land_Sunshade_03_F",[2228.07,8651.64,1.30592],[[-0.30634,-0.951922,0],[0,0,1]],[false,false]],
	["Land_BagFence_End_F",[2228.1,8651.77,1.30592],[[-0.972199,0.234155,0],[0,0,1]],[false,false]],
	["Exile_Sign_Boat",[5640.38,10385.3,2.22354],[[-0.93713,0.34898,0],[0,0,1]],[false,false]],
	["Exile_Sign_Boat",[14351.4,11639.7,0.262586],[[0.504971,0.863136,0],[0,0,1]],[false,false]],
	["Land_Sunshade_03_F",[14353.5,11638.2,0.402971],[[0.961792,0.268773,0.0521326],[-0.0585666,0.0159702,0.998156]],[false,false]],
	["Land_Sunshade_01_F",[4259.99,11639.8,1.81906],[[0,1,0],[0,0,1]],[false,false]],
	["Land_BagFence_End_F",[4260.2,11639.9,1.81906],[[0,1,0],[0,0,1]],[false,false]]
	
];	
{
    private ["_object"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object allowDamage false;
    _object enableSimulationGlobal false; // :)
}
forEach _objects;