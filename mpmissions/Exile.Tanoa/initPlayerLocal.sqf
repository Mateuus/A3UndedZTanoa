///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////

// Taken away for now
//#include "initServer.sqf"

if (!hasInterface || isServer) exitWith {};
private _traders = [

	//Aircraft Trader La Rochelle///////////////////////////////////////////
	
	["Exile_Trader_AircraftCustoms",[11803,13071.9,0],291,"Exile_Trader_AircraftCustoms","GreekHead_A3_07"],
	["Exile_Trader_Aircraft",[11803.599,13076.02,0],282.571,"Exile_Trader_Aircraft","WhiteHead_05"],
	["Exile_Trader_Armory",[11794.61,13055.545,0.039],287.379,"Exile_Trader_Armory","GreekHead_A3_09"],
	["Exile_Trader_Equipment",[11791.963,13048.375, 0.042],298.051,"Exile_Trader_Equipment","WhiteHead_18"],
	["Exile_Trader_Food",[11768.687,13056.626,0.068],78.304,"Exile_Trader_Food","WhiteHead_01"],
	["Exile_Trader_Hardware",[11790.425,13044.497,0.044],328.561,"Exile_Trader_Hardware","WhiteHead_16"],
	["Exile_Trader_Office",[11769.449,13051.706,0.067],20.168,"Exile_Trader_Office","WhiteHead_21"],
	//TO DO//["Exile_Trader_SpecialOperations",[10949.3,11477.7,0.00143433],90,"Exile_Trader_SpecialOperations","WhiteHead_21"],
	["Exile_Trader_Vehicle",[11771.093,13062.66,0.065],101.757,"Exile_Trader_Vehicle","AfricanHead_02"],
	["Exile_Trader_VehicleCustoms",[11772.3,13065.6,0],103,"Exile_Trader_VehicleCustoms","GreekHead_A3_07"],
	["Exile_Trader_WasteDump",[11802.41,13065.266,0],328.561,"Exile_Trader_WasteDump","GreekHead_A3_06"],
	
	//Oumere Trader City///////////////////////////////////////////
	
	["Exile_Trader_Armory",[12097,6695.29,0],1,"Exile_Trader_Armory","GreekHead_A3_09"],
	["Exile_Trader_Equipment",[12102.9,6713.92,0],182.54,"Exile_Trader_Equipment","WhiteHead_18"],
	["Exile_Trader_Food",[12119.1,6717.05,0],217,"Exile_Trader_Food","WhiteHead_01"],
	["Exile_Trader_Hardware",[12105,6696.19,0],1,"Exile_Trader_Hardware","WhiteHead_16"],
	["Exile_Trader_Office",[12116.4,6703.55,0],328,"Exile_Trader_Office","WhiteHead_21"],
	//TO DO//["Exile_Trader_SpecialOperations",[10949.3,11477.7,0.00143433],90,"Exile_Trader_SpecialOperations","WhiteHead_21"],
	["Exile_Trader_Vehicle",[12094.3,6711.76,0],161,"Exile_Trader_Vehicle","AfricanHead_02"],
	//TO DO//["Exile_Trader_VehicleCustoms",[10949.3,11473.4,0.00143433],87.1123,"Exile_Trader_VehicleCustoms","GreekHead_A3_07"],
	["Exile_Trader_WasteDump",[12089.1,6712.44,0],169,"Exile_Trader_WasteDump","GreekHead_A3_06"],
	
	
	//Belfort Trader City///////////////////////////////////////////
	
	["Exile_Trader_Armory",[2426.43,11354.7,0],238,"Exile_Trader_Armory","GreekHead_A3_09"],
	["Exile_Trader_Equipment",[2422.6,11347.6,0],312,"Exile_Trader_Equipment","WhiteHead_18"],
	["Exile_Trader_Food",[2414.73,11344.4,0],320,"Exile_Trader_Food","WhiteHead_01"],
	["Exile_Trader_Hardware",[2424.52,11358.3,0],227,"Exile_Trader_Hardware","WhiteHead_16"],
	["Exile_Trader_Office",[2411.98,11343,0],2,"Exile_Trader_Office","WhiteHead_21"],
	["Exile_Trader_Vehicle",[2417.68,11358.8,0],230,"Exile_Trader_Vehicle","AfricanHead_02"],
    ["Exile_Trader_VehicleCustoms",[2418.39,11356.7,0],230,"Exile_Trader_VehicleCustoms","GreekHead_A3_07"],
	["Exile_Trader_WasteDump",[2407.5,11350.4,0],103,"Exile_Trader_WasteDump","GreekHead_A3_06"],
	

		
	//Laikoro Trader City///////////////////////////////////////////
	
	["Exile_Trader_Armory",[2285.83,6348.09,0],207,"Exile_Trader_Armory","GreekHead_A3_09"],
	["Exile_Trader_Equipment",[2271.74,6354.3,0],204,"Exile_Trader_Equipment","WhiteHead_18"],
	["Exile_Trader_Food",[2277.18,6351.34,0],205,"Exile_Trader_Food","WhiteHead_01"],
	["Exile_Trader_Hardware",[2260.69,6340.74,0],116,"Exile_Trader_Hardware","WhiteHead_16"],
	["Exile_Trader_Office",[2263.05,6345.3,0],116,"Exile_Trader_Office","WhiteHead_21"],
	["Exile_Trader_Vehicle",[2258.14,6320.44,0],102,"Exile_Trader_Vehicle","AfricanHead_02"],
	["Exile_Trader_VehicleCustoms",[2256.43,6316.64,0],102,"Exile_Trader_VehicleCustoms","GreekHead_A3_07"],
	["Exile_Trader_WasteDump",[2267.74,6312.62,0],291,"Exile_Trader_WasteDump","GreekHead_A3_06"],
		
	//WasteDump 1
	
	["Exile_Trader_WasteDump",[6273.27,10967.3,0],191,"Exile_Trader_WasteDump","GreekHead_A3_06"],
	
	//WasteDump 2
	
	["Exile_Trader_WasteDump",[2885.24,3569.61,0],78,"Exile_Trader_WasteDump","GreekHead_A3_06"],
	
	//Boat Traders//////////////////////////////////////////////////
	
	["Exile_Trader_Boat",[8951.8,4770.62,0.0112848],147.86,"Exile_Trader_Boat","GreekHead_A3_06"],
	["Exile_Trader_Boat",[8933.3,4773.4,0.00987625],140.266,"Exile_Trader_Boat","WhiteHead_13"],
	["Exile_Trader_Boat",[5674.98,3930.09,10.3512],0,"Exile_Trader_Boat","WhiteHead_14"],
	["Exile_Trader_Boat",[2227.23,8650.98,7.39473],192.23,"Exile_Trader_Boat","WhiteHead_11"],
	["Exile_Trader_Boat",[5641.18,10387.4,2.85062],110.219,"Exile_Trader_Boat","WhiteHead_08"],
	["Exile_Trader_Boat",[14352.6,11637.9,0.00552577],223.502,"Exile_Trader_Boat","WhiteHead_19"],
	["Exile_Trader_Boat",[4260.17,11640.8,9.4704],267.345,"Exile_Trader_Boat","WhiteHead_03"]
	
	
	
	
	
	
];
{
	private _trader = [
		_x select 0,
		_x select 4,
		["HubStanding_idle1"],
		_x select 1,
		_x select 2
	] call ExileClient_object_trader_create;
	_trader setVariable ["ExileTraderType", _x select 3];
} forEach _traders;