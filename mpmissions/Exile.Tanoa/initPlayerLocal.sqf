///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////

// Taken away for now
//#include "initServer.sqf"

[] execVM "welcome.sqf";
[] execVM "addons\statusBar\statusbar.sqf";
[] execVM "HC\init.sqf";
execVM "zcp.sqf";
[] execVM "MostWanted_Client\MostWanted_Init.sqf";
[] execVM "MarXet\MarXet_Init.sqf";

if (!hasInterface || isServer) exitWith {};

ppEffectDestroy ExileClientPostProcessingColorCorrections;
ppEffectDestroy ExileClientPostProcessingBorderVignette;

///////////////////////////////////////////////////////////////////////////
// Bala Aircraft Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [2162.54,3470.57,0.00143909],
	348.408
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Aircraft"];


///////////////////////////////////////////////////////////////////////////
// Bala Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [2145.63,3465.59,0.00143909],
	342.903
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Bala Aircraft Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [2164.73,3431.88,0.00143909],
	319.333
]
call ExileClient_object_trader_create;



///////////////////////////////////////////////////////////////////////////
// Tanouka Hardware Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9896.04,9409.58,0.00315094],
    224.614
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Hardware"];


///////////////////////////////////////////////////////////////////////////
// Tanouka Fast Food Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9941.82,9393.51,0.00644684],
	297.683
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Food"];

///////////////////////////////////////////////////////////////////////////
// Tanouka Armory Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9923.42,9391.11,0.616058],
	336.574
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Armory"];

///////////////////////////////////////////////////////////////////////////
// Tanouka Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9911.55,9382.63,0.00882721],
	117.023
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Equipment"];


///////////////////////////////////////////////////////////////////////////
// Tanouka Office Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9877.61,9408.11,0.00553131],
	76.6121
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Tanouka Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [9922,9411.67,0.00479889],
	152.56
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
// Tanouka Vehicle Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9876.93,9437.4,0.00483704],
	302.25
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Vehicle"];


///////////////////////////////////////////////////////////////////////////
// Tanouka Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9887.97,9452.08,0.00366211],
	293.466
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Tanouka Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [9896.1,9397.93,15.1113],
	0
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_SpecialOperations"];

///////////////////////////////////////////////////////////////////////////
// Vliegende Hardware Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [12517.5,2442.67,0.00371075],
    22.7548
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Hardware"];


///////////////////////////////////////////////////////////////////////////
// Vliegende Fast Food Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [12557,2446.68,0.00250864],
	252.705
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Food"];

///////////////////////////////////////////////////////////////////////////
// Vliegende Armory Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [12560.7,2434.45,0.00343466],
	262.216
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Armory"];

///////////////////////////////////////////////////////////////////////////
// Vliegende Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [12558.8,2440.96,0.00264215],
	249.795
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Equipment"];


///////////////////////////////////////////////////////////////////////////
// Vliegende Office Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [12564.4,2466.64,0.916438],
	253.477
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vliegende Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [12540.8,2468.72,0.00143719],
	242.501
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
// Vliegende Vehicle Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [12486.8,2415.6,0.00676107],
	254.657
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Vehicle"];


///////////////////////////////////////////////////////////////////////////
// Vliegende Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [12481.4,2431.71,0.00745344],
	256.384
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vliegende Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [12555,2458.79,12.6379],
	307.694
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_SpecialOperations"];

///////////////////////////////////////////////////////////////////////////
// Vliegende Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [12487.2,2578.56,0.00716031],
	112.544
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Boat"];

///////////////////////////////////////////////////////////////////////////
// Belfort Vehicle Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [2629.42,11749.4,0.00117111],
	207.97
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Vehicle"];


///////////////////////////////////////////////////////////////////////////
// Belfort Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [2640.21,11741.9,0.00144196],
	223.366
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Belfort Aircraft Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [2645.74,11719.3,0.000648499],
	241.939
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Aircraft"];


///////////////////////////////////////////////////////////////////////////
// Belfort Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [2651.34,11702.4,0.000648499],
	251.612
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Cocoa Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [9412.06,6185.86,2.47557],
	261.71
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Boat"];

///////////////////////////////////////////////////////////////////////////
// Belfort Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [3686.74,11388.1,1.69833],
	284.999
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Boat"];

///////////////////////////////////////////////////////////////////////////
// Leqa Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [2272.51,8611.99,2.31998],
	183.967
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Boat"];

///////////////////////////////////////////////////////////////////////////
// Savaka Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [7227.23,4279.29,0.00103968],
	272.009
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Boat"];

///////////////////////////////////////////////////////////////////////////
// Savu Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [8369.67,13755.4,0.00319949],
	153.826
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Boat"];

///////////////////////////////////////////////////////////////////////////
// Ipota Boat Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [12244.4,13842.8,-0.00225246],
	33.9936
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Boat"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms1
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [12164.4,11420.1,0.00131226],
	324.254
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms2
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms2",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [13888.4,11028.9,0.00512695],
	59.1967
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms2"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms3
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms3",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [10279.3,10343,0.417389],
	162.241
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms3"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms4
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms4",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [4088.52,5800.82,0.000638962],
	52.6679
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms4"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms5
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms5",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [1053.64,7570.17,0.4965],
	91.5231
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms5"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms6
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms6",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [3710.32,2050.35,-0.00332308],
	199.91
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms6"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms7
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms7",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [12111.4,8640.64,0.00933838],
	312.701
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms7"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms8
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms8",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [4017.83,13579.1,0.277328],
	148.619
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms8"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms9
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms9",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [5642.17,11059.9,12.0967],
	153.528
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms9"];

///////////////////////////////////////////////////////////////////////////
//Exile_Trader_CommunityCustoms10
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_CommunityCustoms10",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [11615.7,4869.58,-0.00241852],
	20.2045
    
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms10"];

///////////////////////////////////////////////////////////////////////////
// Cocoa Boat Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [9393.07,6196.18,-0.00198877],
	28.1296
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Belfort Boat Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3663.83,11399.9,-0.00836349],
	46.0057
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Lequa Boat Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [2279.39,8612.19,2.409],
	197.813
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Savaka Boat Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [7226.72,4273.91,0.000911504],
	300.707
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Savu Boat Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [8379.72,13756.4,0.00302088],
	187.65
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Ipota Boat Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [12239,13849.6,-0.0016495],
	75.9638
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Heli Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [2647.92,11734.6,0.00130844],
	256.361
]
call ExileClient_object_trader_create;


//Announce Pay
waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
uiSleep 1;
execVM "announcepay.sqf";