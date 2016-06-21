/*///////////////////////////////////////////
//Filename : ETG_HeliCrashAndDropScript.sqf//
//Author : Kellojo///////////////////////////
//Version : 1.6 /////////////////////////////
//Release : 23.11.2015 //////////////////////
/////////////////////////////////////////////

/////////
//Usage//
/////////

This script allows you to add heli crashes and supply drops to your mission.

////////////
//Features//
////////////

- cargo drops
- heli crashes
- several tiers of loot
- spawn position of the helis is randomly selected
- type of cargo is randomly selected
- type of heli is randomly selected
- type of mission is randomly selected
- drop off point/ crash point is randomly selected
- adjustable loot tables
- loot is completely randomized
- time between drops is now configurable
- toggable markers at the heli crashes/supply drops
- loot can spawn inside of the crates and on the ground (selectable)
- added more configurable options such as (helis,crates,loot on ground etc.)
- added random time between drops/crashes function
- added configurable altitude
- added toggable fire at crashsites
- added toggable AI to crashes and supply drops
- added automatic deletion of crashes/supply drops

/////////
//Notes//
/////////

If you have any ideas for the script feel free to add me on Steam. My name is "Kellojo" ;).

//////////////
//Known Bugs//
//////////////
Here I will list every know bug that im currently working on. 
If you have any ideas how to fix them writing a comment or a private message would be nice ;).
- Heli Crashes: sometimes the heli wrack spawns in the ground and the loot around it spawns in the ground...

////////////////////////////////////////////////
//Can I use this script for my mission/server?//
////////////////////////////////////////////////

Yes, you can use this script for your server aswell as you can modify it however you want.
Its not necessary to give credit to me but it would be appreciated. :)

//////////////////////////////////////////////
//How can i run the script?---> Installation//
//////////////////////////////////////////////

Simply add these two lines below to your init.sqf and the script will do the rest for you.

ETG_Cargo_Drop_Mission = 0;
_nul = execVM "ETG_HeliCrashAndDropScript.sqf";

*/

//Edit below me:
	
/////////////////
//Configuration//
/////////////////
_SleepTime = 3200;											//Time between every heli crash/supply drop in seconds (integer)
_SleepTimeRandom = true;									//If true will randomize your time between the drops/crashes
_AllowMarkers = false;										//Do you want markers at the helicrashes and supply drops? (true,false)
_MarkerType = "mil_dot";									//Type of marker? (https://community.bistudio.com/wiki/cfgMarkers) (string)
_LootOnGround = false;										//Do you want to spawn the loot at the heli crash on the ground or inside of the boxes? (true,false)
_FlyHeight = 500;											//Height the heli shoud fly at - altitude (in meters)
_LootSpawnRadius = 20;										//Radius around the crate/crates the loot will spawn in
_CrateSpawnRadius = 30;										//Radius around the crashsite the crates will spawn in
_FireAtCrashSite = true;									//Should fire be around the helicrashsite ? (true/false)
_AI_Crash = false;											//AI at crashes ? (true/false)
_AI_Drop = false;											//AI at supply drops ? (true/false)
_DeletionDelay = 7600;										//Time the helicrashes/supply drops will stay and be deleted after (time in seconds)
_CratesAtCrashes = true;                                  	//Do you want crates at your heli crash ? (true/false) - keep in mind to set _LootOnGround to true when setting this to false!!!
_MaxAmmountOfItems = 9;										//Ammount of Magazines and Items that can spawn at one lootpile
_MaxItemCount = 20;											//Max ammount of individual items
_MaxMagazineCount = 30;										//Max ammount of individual magazines
_MaxWeaponCount = 25;										//Max ammount of individual weapons
_MaxBackpackCount = 15;										//Max ammount of individual backpacks
_RPT = false;												//Writes debug information to the rpt file. (true/false)
_Debug = false;												//creates a marker on the map matching the position of the heli (true/false)
_CenterRadius = 8500;										//Radius around the _CenterOfMap (make sure its covering the whole map - Integer)


//Change this path,if you have moved the script in a special folder of your mission, its the one to the script itself
_ETG_ScriptPath = "ETG_HeliCrashAndDropScript.sqf";

//Edit these coordinates, these are the spawn coordinates of the helis/planes choose coodrinates at the corners of the map (use coodrinates according to your map/likings - these are for Altis)
_ETG_StartionPositions =
						[
							[252.291,290.771,0],
							[15012.41,391.763,0],
							[292.408,292.408,0],
							[15012.407,15012.407,0]
						];

//Edit this coordinate it should be roughly the center of the map you are playing on (this one is for Altis)
_CenterOfMap = [7866.108,7541.369,0];

//Available heli/plane types - add your own ones
_ETG_HeliTypes = ["I_Heli_light_03_unarmed_F","O_Heli_Transport_04_F","B_Heli_Transport_01_F","O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_box_F","B_Heli_Transport_03_unarmed_F","I_Heli_Transport_02_F"]; 
 
//Add your types of cargo here (crate classnames)
_ETG_CargoTypes = ["I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F","Box_East_AmmoVeh_F","Box_NATO_AmmoVeh_F"];

//Lootboxes spawning at heli crashes (small boxes/crates look better)
_ETG_HeliCrashLootBoxes = ["Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","Box_IND_AmmoVeh_F","I_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","Box_East_Support_F","Box_NATO_AmmoOrd_F","Box_East_AmmoOrd_F"];

//AI that will spawn at the crashsites/drops (use classnames of units)
_ETG_AIUnits = ["O_recon_medic_F", "O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_A_F","O_Soldier_lite_F"];

////////////////////////////////////////////////////////////////
//Only edit anything down here, if you know what you are doing//
////////////////////////////////////////////////////////////////

//Do not edit this ;)
if (isServer) then {
	//Check if the script is already running
	if (ETG_Cargo_Drop_Mission != 1) then {
	ETG_Cargo_Drop_Mission = 1;	

	//Scan for bad data
	if (!_CratesAtCrashes) then {
		_LootOnGround = true;
	};
	
	//Set the starting position of the heli
	_startPos = _ETG_StartionPositions call BIS_fnc_selectRandom;
	//Get the position of the drop/crash	
	_ETG_Main_Coordinates = [_CenterOfMap, 1, _CenterRadius, 3, 0, 200, 0] call BIS_fnc_findSafePos;
	//Choose heli type
	_ETG_Heli_Type = _ETG_HeliTypes call BIS_fnc_selectRandom;  
	//Choose between cargo drop or a heli crash
	_ETG_Mission_Type = ["Cargo_Drop","Heli_Crash"] call BIS_fnc_selectRandom;
	//Choose cargo
	_ETG_Cargo_Type = _ETG_CargoTypes call BIS_fnc_selectRandom;  
	//set sleeptime if random is true
	if (_SleepTimeRandom) then {_SleepTime = round(random _SleepTime)};
	//Do not edit
	ETG_HeliCrashAndDropScriptTransportVehInPosition = false;
	
	/////////////
	//Loottable//
	/////////////
	//Loot that will spawn inside the cargo drop/ or at the crates of the heli drop
	//If you want to edit the loottable please notice that in Arma 3 there are different types of 'loot' (weapons,backpacks,items,magazines)
	//Every tier in this "list" of the six tiers has 4 variables _ETG_Backpacks (for backpacks) _ETG_Magazines (for magazines) _ETG_Weapons (for weapons) _ETG_Items (for items)
	//Edit the 4 variables like this:
	//			_ETG_Weapons = ["Classname","Classname"];
	//			_ETG_Weapons = ["srifle_EBR_ARCO_pointer_F","srifle_EBR_ARCO_pointer_F"];
	//Add classnames (only classnames eg: "B_Bergen_rgr","B_FieldPack_oucamo") to these arrays.
	//_ETG_Magazines is for general items (e.g. for wood gates etc.)
	//!!! There is no need to add magazines for weapons to _ETG_Magazines - they will be added automatically to the weapon itself!!!
	_ETG_Backpacks =	[
								'B_AssaultPack_blk',
								'B_AssaultPack_cbr',
								'B_AssaultPack_dgtl',
								'B_AssaultPack_khk',
								'B_AssaultPack_mcamo',
								'B_AssaultPack_rgr',
								'B_AssaultPack_sgg',
								'B_Bergen_blk',
								'B_Bergen_mcamo',
								'B_Bergen_rgr',
								'B_Bergen_sgg',
								'B_Carryall_cbr',
								'B_Carryall_khk',
								'B_Carryall_mcamo',
								'B_Carryall_ocamo',
								'B_Carryall_oli',
								'B_Carryall_oucamo',
								'B_FieldPack_blk',
								'B_FieldPack_cbr',
								'B_FieldPack_ocamo',
								'B_FieldPack_oucamo',
								'B_HuntingBackpack',
								'B_Kitbag_rgr',
								'B_Kitbag_cbr',
								'B_Kitbag_mcamo',
								'B_Kitbag_sgg',
								'B_OutdoorPack_Base',
								'B_OutdoorPack_blk',
								'B_OutdoorPack_blu',
								'B_OutdoorPack_tan',
								'B_TacticalPack_blk',
								'B_TacticalPack_mcamo',
								'B_TacticalPack_ocamo',
								'B_TacticalPack_oli',
								'B_TacticalPack_rgr'
						];
	_ETG_Weapons = 		[	
								'CUP_hgun_Colt1911',
								'CUP_hgun_Compact',
								'CUP_hgun_Duty_M3X',
								'CUP_hgun_Glock17',
								'CUP_hgun_M9',
								'CUP_hgun_Makarov',
								'CUP_hgun_PB6P9',
								'CUP_hgun_MicroUzi',
								'CUP_hgun_TaurusTracker455',
								'CUP_hgun_TaurusTracker455_gold',
								'CUP_hgun_SA61',
								'CUP_hgun_Duty',
								'CUP_hgun_Phantom',
								'CUP_smg_bizon',
								'CUP_smg_EVO',
								'CUP_smg_MP5SD6',
								'CUP_smg_MP5A5',
								'CUP_lmg_L7A2',
								'CUP_lmg_L110A1',
								'CUP_lmg_M240',
								'CUP_lmg_M249',
								'CUP_lmg_Mk48_des',
								'CUP_lmg_Mk48_wdl',
								'CUP_lmg_PKM',
								'CUP_lmg_UK59',
								'CUP_lmg_Pecheneg',
								'CUP_arifle_AK74',
								'CUP_arifle_AK107',
								'CUP_arifle_AK107_GL',
								'CUP_arifle_AKS74',
								'CUP_arifle_AKS74U',
								'CUP_arifle_AK74_GL',
								'CUP_arifle_AKM',
								'CUP_arifle_AKS',
								'CUP_arifle_AKS_Gold',
								'CUP_arifle_RPK74',
								'CUP_arifle_CZ805_A2',
								'CUP_arifle_FNFAL',
								'CUP_arifle_FNFAL_railed',
								'CUP_arifle_G36A',
								'CUP_arifle_G36A_camo',
								'CUP_arifle_G36K',
								'CUP_arifle_G36K_camo',
								'CUP_arifle_G36C',
								'CUP_arifle_G36C_camo',
								'CUP_arifle_MG36',
								'CUP_arifle_MG36_camo',
								'CUP_arifle_L85A2',
								'CUP_arifle_L85A2_GL',
								'CUP_arifle_L86A2',
								'CUP_arifle_M16A2',
								'CUP_arifle_M4A1',
								'CUP_arifle_M4A1_camo',
								'CUP_arifle_M16A4_Base',
								'CUP_arifle_M4A1_BUIS_GL',
								'CUP_arifle_M4A1_BUIS_camo_GL',
								'CUP_arifle_M4A1_BUIS_desert_GL',
								'CUP_arifle_M4A1_black',
								'CUP_arifle_M4A1_desert',
								'CUP_arifle_Sa58P',
								'CUP_arifle_Sa58V',
								'CUP_arifle_Mk16_CQC',
								'CUP_arifle_XM8_Compact_Rail',
								'CUP_arifle_XM8_Railed',
								'CUP_arifle_XM8_Carbine',
								'CUP_arifle_XM8_Carbine_FG',
								'CUP_arifle_XM8_Carbine_GL',
								'CUP_arifle_XM8_Compact',
								'CUP_arifle_xm8_SAW',
								'CUP_arifle_xm8_sharpshooter',
								'CUP_arifle_CZ805_A1',
								'CUP_arifle_CZ805_GL',
								'CUP_arifle_CZ805_B_GL',
								'CUP_arifle_CZ805_B',
								'CUP_arifle_Sa58P_des',
								'CUP_arifle_Sa58V_camo',
								'CUP_arifle_Sa58RIS1',
								'CUP_arifle_Sa58RIS1_des',
								'CUP_arifle_Sa58RIS2',
								'CUP_arifle_Sa58RIS2_camo',
								'CUP_arifle_Mk16_CQC_FG',
								'CUP_arifle_Mk16_CQC_SFG',
								'CUP_arifle_Mk16_CQC_EGLM',
								'CUP_arifle_Mk16_STD',
								'CUP_arifle_Mk16_STD_FG',
								'CUP_arifle_Mk16_STD_SFG',
								'CUP_arifle_Mk16_STD_EGLM',
								'CUP_arifle_Mk16_SV',
								'CUP_arifle_Mk17_CQC',
								'CUP_arifle_Mk17_CQC_FG',
								'CUP_arifle_Mk17_CQC_SFG',
								'CUP_arifle_Mk17_CQC_EGLM',
								'CUP_arifle_Mk17_STD',
								'CUP_arifle_Mk17_STD_FG',
								'CUP_arifle_Mk17_STD_SFG',
								'CUP_arifle_Mk17_STD_EGLM',
								'CUP_arifle_Mk20',
								'CUP_sgun_AA12',
								'CUP_sgun_M1014',
								'CUP_sgun_Saiga12K',
								'CUP_srifle_AWM_des',
								'CUP_srifle_AWM_wdl',
								'CUP_srifle_CZ750',
								'CUP_srifle_DMR',
								'CUP_srifle_CZ550',
								'CUP_srifle_LeeEnfield',
								'CUP_srifle_M14',
								'CUP_srifle_Mk12SPR',
								'CUP_srifle_M24_des',
								'CUP_srifle_M24_wdl',
								'CUP_srifle_M40A3',
								'CUP_srifle_M107_Base',
								'CUP_srifle_M110',
								'CUP_srifle_SVD',
								'CUP_srifle_SVD_des',
								'CUP_srifle_ksvk',
								'CUP_srifle_VSSVintorez',
								'CUP_srifle_AS50',
								'CUP_glaunch_M32',
								'CUP_glaunch_M79',
								'CUP_glaunch_Mk13',
								'CUP_launch_Igla',
								'CUP_launch_Javelin',
								'CUP_launch_M47',
								'CUP_launch_M136',
								'CUP_launch_MAAWS_Scope',
								'CUP_launch_Metis',
								'CUP_launch_NLAW',
								'CUP_launch_RPG7V',
								'CUP_launch_RPG18',
								'CUP_launch_FIM92Stinger',
								'CUP_launch_MAAWS',
								'CUP_launch_Mk153Mod0',
								'CUP_launch_9K32Strela',
								'launch_NLAW_F',
								'launch_RPG32_F',
								'launch_B_Titan_F',
								'launch_I_Titan_F',
								'launch_O_Titan_F',
								'launch_Titan_F',
								'launch_B_Titan_short_F',
								'launch_I_Titan_short_F', 
								'launch_O_Titan_short_F', 
								'launch_Titan_short_F',
								'HandGrenade',
								'MiniGrenade',
								'B_IR_Grenade',
								'O_IR_Grenade',
								'I_IR_Grenade',
								'1Rnd_HE_Grenade_shell',
								'3Rnd_HE_Grenade_shell',
								'APERSBoundingMine_Range_Mag',
								'APERSMine_Range_Mag',
								'APERSTripMine_Wire_Mag',
								'ClaymoreDirectionalMine_Remote_Mag',
								'DemoCharge_Remote_Mag',
								'IEDLandBig_Remote_Mag',
								'IEDLandSmall_Remote_Mag',
								'IEDUrbanBig_Remote_Mag',
								'IEDUrbanSmall_Remote_Mag',
								'SatchelCharge_Remote_Mag',
								'SLAMDirectionalMine_Wire_Mag',
								'hgun_ACPC2_F',
								'hgun_P07_F',
								'hgun_Pistol_heavy_01_F',
								'hgun_Pistol_heavy_02_F',
								'hgun_Pistol_Signal_F',
								'hgun_Rook40_F',
								'arifle_MX_SW_Black_F',
								'arifle_MX_SW_F',
								'LMG_Mk200_F',
								'LMG_Zafir_F',
								'MMG_01_hex_F',
								'MMG_01_tan_F',
								'MMG_02_black_F',
								'MMG_02_camo_F',
								'MMG_02_sand_F',
								'arifle_Katiba_C_F',
								'arifle_Katiba_F',
								'arifle_Katiba_GL_F',
								'arifle_Mk20_F',
								'arifle_Mk20_GL_F',
								'arifle_Mk20_GL_plain_F',
								'arifle_Mk20_plain_F',
								'arifle_Mk20C_F',
								'arifle_Mk20C_plain_F',
								'arifle_MX_Black_F',
								'arifle_MX_F',
								'arifle_MX_GL_Black_F',
								'arifle_MX_GL_F',
								'arifle_MXC_Black_F',
								'arifle_MXC_F',
								'arifle_SDAR_F',
								'arifle_TRG20_F',
								'arifle_TRG21_F',
								'arifle_TRG21_GL_F',
								'arifle_MXM_Black_F',
								'arifle_MXM_F',
								'srifle_DMR_01_F',
								'srifle_DMR_02_camo_F',
								'srifle_DMR_02_F',
								'srifle_DMR_02_sniper_F',
								'srifle_DMR_03_F',
								'srifle_DMR_03_khaki_F',
								'srifle_DMR_03_multicam_F',
								'srifle_DMR_03_tan_F',
								'srifle_DMR_03_woodland_F',
								'srifle_DMR_04_F',
								'srifle_DMR_04_Tan_F',
								'srifle_DMR_05_blk_F',
								'srifle_DMR_05_hex_F',
								'srifle_DMR_05_tan_f',
								'srifle_DMR_06_camo_F',
								'srifle_DMR_06_olive_F',
								'srifle_EBR_F',
								'srifle_GM6_camo_F',
								'srifle_GM6_F',
								'srifle_LRR_camo_F',
								'srifle_LRR_F'
						];
	_ETG_Items = 		[
								'U_B_CombatUniform_mcam',
								'U_B_CombatUniform_mcam_tshirt',
								'U_B_CombatUniform_mcam_vest',
								'U_B_CombatUniform_mcam_worn',
								'U_B_CTRG_1',
								'U_B_CTRG_2',
								'U_B_CTRG_3',
								'U_I_CombatUniform',
								'U_I_CombatUniform_shortsleeve',
								'U_I_CombatUniform_tshirt',
								'U_I_OfficerUniform',
								'U_O_CombatUniform_ocamo',
								'U_O_CombatUniform_oucamo',
								'U_O_OfficerUniform_ocamo',
								'U_B_SpecopsUniform_sgg',
								'U_O_SpecopsUniform_blk',
								'U_O_SpecopsUniform_ocamo',
								'U_I_G_Story_Protagonist_F',
								'Exile_Uniform_Woodland',
								'U_C_HunterBody_grn',
								'U_IG_Guerilla1_1',
								'U_IG_Guerilla2_1',
								'U_IG_Guerilla2_2',
								'U_IG_Guerilla2_3',
								'U_IG_Guerilla3_1',
								'U_BG_Guerilla2_1',
								'U_IG_Guerilla3_2',
								'U_BG_Guerrilla_6_1',
								'U_BG_Guerilla1_1',
								'U_BG_Guerilla2_2',
								'U_BG_Guerilla2_3',
								'U_BG_Guerilla3_1',
								'U_BG_leader',
								'U_IG_leader',
								'U_I_G_resistanceLeader_F',
								'U_B_FullGhillie_ard',
								'U_B_FullGhillie_lsh',
								'U_B_FullGhillie_sard',
								'U_B_GhillieSuit',
								'U_I_FullGhillie_ard',
								'U_I_FullGhillie_lsh',
								'U_I_FullGhillie_sard',
								'U_I_GhillieSuit',
								'U_O_FullGhillie_ard',
								'U_O_FullGhillie_lsh',
								'U_O_FullGhillie_sard',
								'U_O_GhillieSuit',
								'U_I_Wetsuit',
								'U_O_Wetsuit',
								'U_B_Wetsuit',
								'U_B_survival_uniform',
								'U_B_HeliPilotCoveralls',
								'U_I_HeliPilotCoveralls',
								'U_B_PilotCoveralls',
								'U_I_pilotCoveralls',
								'U_O_PilotCoveralls',
								'V_Press_F',
								'V_Rangemaster_belt',
								'V_TacVest_blk',
								'V_TacVest_blk_POLICE',
								'V_TacVest_brn',
								'V_TacVest_camo',
								'V_TacVest_khk',
								'V_TacVest_oli',
								'V_TacVestCamo_khk',
								'V_TacVestIR_blk',
								'V_I_G_resistanceLeader_F',
								'V_BandollierB_blk',
								'V_BandollierB_cbr',
								'V_BandollierB_khk',
								'V_BandollierB_oli',
								'V_BandollierB_rgr',
								'V_Chestrig_blk',
								'V_Chestrig_khk',
								'V_Chestrig_oli',
								'V_Chestrig_rgr',
								'V_HarnessO_brn',
								'V_HarnessO_gry',
								'V_HarnessOGL_brn',
								'V_HarnessOGL_gry',
								'V_HarnessOSpec_brn',
								'V_HarnessOSpec_gry',
								'V_PlateCarrier_Kerry',
								'V_PlateCarrier1_blk',
								'V_PlateCarrier1_rgr',
								'V_PlateCarrier2_blk',
								'V_PlateCarrier2_rgr',
								'V_PlateCarrier3_rgr',
								'V_PlateCarrierGL_blk',
								'V_PlateCarrierGL_mtp',
								'V_PlateCarrierGL_rgr',
								'V_PlateCarrierH_CTRG',
								'V_PlateCarrierIA1_dgtl',
								'V_PlateCarrierIA2_dgtl',
								'V_PlateCarrierIAGL_dgtl',
								'V_PlateCarrierIAGL_oli',
								'V_PlateCarrierL_CTRG',
								'V_PlateCarrierSpec_blk',
								'V_PlateCarrierSpec_mtp',
								'V_PlateCarrierSpec_rgr',
								'H_Cap_blk',
								'H_Cap_blk_Raven',
								'H_Cap_blu',
								'H_Cap_brn_SPECOPS',
								'H_Cap_grn',
								'H_Cap_headphones',
								'H_Cap_khaki_specops_UK',
								'H_Cap_oli',
								'H_Cap_press',
								'H_Cap_red',
								'H_Cap_tan',
								'H_Cap_tan_specops_US',
								'H_Watchcap_blk',
								'H_Watchcap_camo',
								'H_Watchcap_khk',
								'H_Watchcap_sgg',
								'H_MilCap_blue',
								'H_MilCap_dgtl',
								'H_MilCap_mcamo',
								'H_MilCap_ocamo',
								'H_MilCap_oucamo',
								'H_MilCap_rucamo',
								'H_Bandanna_camo',
								'H_Bandanna_cbr',
								'H_Bandanna_gry',
								'H_Bandanna_khk',
								'H_Bandanna_khk_hs',
								'H_Bandanna_mcamo',
								'H_Bandanna_sgg',
								'H_Bandanna_surfer',
								'H_Booniehat_dgtl',
								'H_Booniehat_dirty',
								'H_Booniehat_grn',
								'H_Booniehat_indp',
								'H_Booniehat_khk',
								'H_Booniehat_khk_hs',
								'H_Booniehat_mcamo',
								'H_Booniehat_tan',
								'H_Hat_blue',
								'H_Hat_brown',
								'H_Hat_camo',
								'H_Hat_checker',
								'H_Hat_grey',
								'H_Hat_tan',
								'H_StrawHat',
								'H_StrawHat_dark',
								'H_Beret_02',
								'H_Beret_blk',
								'H_Beret_blk_POLICE',
								'H_Beret_brn_SF',
								'H_Beret_Colonel',
								'H_Beret_grn',
								'H_Beret_grn_SF',
								'H_Beret_ocamo',
								'H_Beret_red',
								'H_Shemag_khk',
								'H_Shemag_olive',
								'H_Shemag_olive_hs',
								'H_Shemag_tan',
								'H_ShemagOpen_khk',
								'H_ShemagOpen_tan',
								'H_TurbanO_blk',
								'H_HelmetB',
								'H_HelmetB_black',
								'H_HelmetB_camo',
								'H_HelmetB_desert',
								'H_HelmetB_grass',
								'H_HelmetB_light',
								'H_HelmetB_light_black',
								'H_HelmetB_light_desert',
								'H_HelmetB_light_grass',
								'H_HelmetB_light_sand',
								'H_HelmetB_light_snakeskin',
								'H_HelmetB_paint',
								'H_HelmetB_plain_blk',
								'H_HelmetB_sand',
								'H_HelmetB_snakeskin',
								'H_HelmetCrew_B',
								'H_HelmetCrew_I',
								'H_HelmetCrew_O',
								'H_HelmetIA',
								'H_HelmetIA_camo',
								'H_HelmetIA_net',
								'H_HelmetLeaderO_ocamo',
								'H_HelmetLeaderO_oucamo',
								'H_HelmetO_ocamo',
								'H_HelmetO_oucamo',
								'H_HelmetSpecB',
								'H_HelmetSpecB_blk',
								'H_HelmetSpecB_paint1',
								'H_HelmetSpecB_paint2',
								'H_HelmetSpecO_blk',
								'H_HelmetSpecO_ocamo',
								'H_CrewHelmetHeli_B',
								'H_CrewHelmetHeli_I',
								'H_CrewHelmetHeli_O',
								'H_HelmetCrew_I',
								'H_HelmetCrew_B',
								'H_HelmetCrew_O',
								'H_PilotHelmetHeli_B',
								'H_PilotHelmetHeli_I',
								'H_PilotHelmetHeli_O',
								'CUP_optic_PSO_1',
								'CUP_optic_PSO_3',
								'CUP_optic_Kobra',
								'CUP_optic_GOSHAWK',
								'CUP_optic_NSPU',
								'CUP_optic_PechenegScope',
								'CUP_optic_MAAWS_Scope',
								'CUP_optic_SMAW_Scope',
								'CUP_optic_AN_PAS_13c2',
								'CUP_optic_LeupoldMk4',
								'CUP_optic_HoloBlack',
								'CUP_optic_HoloWdl',
								'CUP_optic_HoloDesert',
								'CUP_optic_Eotech533',
								'CUP_optic_CompM4',
								'CUP_optic_SUSAT',
								'CUP_optic_ACOG',
								'CUP_optic_CWS',
								'CUP_optic_Leupold_VX3',
								'CUP_optic_AN_PVS_10',
								'CUP_optic_CompM2_Black',
								'CUP_optic_CompM2_Woodland',
								'CUP_optic_CompM2_Woodland2',
								'CUP_optic_CompM2_Desert',
								'CUP_optic_RCO',
								'CUP_optic_RCO_desert',
								'CUP_optic_LeupoldM3LR',
								'CUP_optic_LeupoldMk4_10x40_LRT_Desert',
								'CUP_optic_LeupoldMk4_10x40_LRT_Woodland',
								'CUP_optic_ElcanM145',
								'CUP_optic_AN_PAS_13c1',
								'CUP_optic_LeupoldMk4_CQ_T',
								'CUP_optic_ELCAN_SpecterDR',
								'CUP_optic_LeupoldMk4_MRT_tan',
								'CUP_optic_SB_11_4x20_PM',
								'CUP_optic_ZDDot',
								'CUP_optic_MRad',
								'CUP_optic_TrijiconRx01_desert',
								'CUP_optic_TrijiconRx01_black',
								'CUP_optic_AN_PVS_4',
								'optic_Aco',
								'optic_ACO_grn',
								'optic_ACO_grn_smg',
								'optic_Aco_smg',
								'optic_AMS',
								'optic_AMS_khk',
								'optic_AMS_snd',
								'optic_Arco',
								'optic_DMS',
								'optic_Hamr',
								'optic_Holosight',
								'optic_Holosight_smg',
								'optic_KHS_blk',
								'optic_KHS_hex',
								'optic_KHS_old',
								'optic_KHS_tan',
								'optic_LRPS',
								'optic_MRCO',
								'optic_MRD',
								'optic_Nightstalker',
								'optic_NVS',
								'optic_SOS',
								'optic_tws',
								'optic_tws_mg',
								'muzzle_snds_338_black',
								'muzzle_snds_338_green',
								'muzzle_snds_338_sand',
								'muzzle_snds_93mmg',
								'muzzle_snds_93mmg_tan',
								'muzzle_snds_acp',
								'muzzle_snds_B',
								'muzzle_snds_H',
								'muzzle_snds_H_MG',
								'muzzle_snds_H_SW',
								'muzzle_snds_L',
								'muzzle_snds_M',
								'CUP_muzzle_PBS4',
								'CUP_muzzle_PB6P9',
								'CUP_muzzle_Bizon',
								'CUP_muzzle_snds_M110',
								'CUP_muzzle_snds_M14',
								'CUP_muzzle_snds_M9',
								'CUP_muzzle_snds_MicroUzi',
								'CUP_muzzle_snds_AWM',
								'CUP_muzzle_snds_G36_black',
								'CUP_muzzle_snds_G36_desert',
								'CUP_muzzle_snds_L85',
								'CUP_muzzle_snds_M16_camo',
								'CUP_muzzle_snds_M16',
								'CUP_muzzle_snds_SCAR_L',
								'CUP_muzzle_mfsup_SCAR_L',
								'CUP_muzzle_snds_SCAR_H',
								'CUP_muzzle_mfsup_SCAR_H',
								'CUP_muzzle_snds_XM8',
								'optic_Yorris'
						];
	_ETG_Magazines = 	[
								'Exile_Item_PortableGeneratorKit',
								'Exile_Item_Rope',
								'Exile_Item_DuctTape',
								'Exile_Item_ExtensionCord',
								'Exile_Item_FuelCanisterEmpty',
								'Exile_Item_JunkMetal',
								'Exile_Item_LightBulb',
								'Exile_Item_MetalBoard',
								'Exile_Item_MetalPole',
								'Exile_Item_SafeKit',
								'Exile_Item_CamoTentKit',
								'Exile_Item_Laptop',
								'Exile_Item_BaseCameraKit',
								'Exile_Item_CodeLock',
								'Exile_Item_EMRE',
								'Exile_Item_GloriousKnakworst',
								'Exile_Item_Surstromming',
								'Exile_Item_SausageGravy',
								'Exile_Item_Catfood',
								'Exile_Item_ChristmasTinner',
								'Exile_Item_BBQSandwich',
								'Exile_Item_Dogfood',
								'Exile_Item_BeefParts',
								'Exile_Item_Cheathas',
								'Exile_Item_Noodles',
								'Exile_Item_SeedAstics',
								'Exile_Item_Raisins',
								'Exile_Item_Moobar',
								'Exile_Item_InstantCoffee',
								'Exile_Item_PlasticBottleCoffee',
								'Exile_Item_PowerDrink',
								'Exile_Item_PlasticBottleFreshWater',
								'Exile_Item_Beer',
								'Exile_Item_EnergyDrink',
								'Exile_Item_MountainDupe',
								'Exile_Item_PlasticBottleEmpty',
								'Exile_Item_Matches',
								'Exile_Item_CookingPot',
								'Exile_Item_CanOpener',
								'Exile_Item_Handsaw',
								'Exile_Item_Pliers',
								'Exile_Item_Grinder',
								'Exile_Magazine_Battery',
								'Binocular',
								'Rangefinder',
								'NVGoggles',
								'NVGoggles_INDEP',
								'NVGoggles_OPFOR',
								'Exile_Item_InstaDoc',
								'Exile_Item_Bandage',
								'Exile_Item_Vishpirin',
								'Exile_Item_Defibrillator'
						];
	
//if its a cargo drop do this		
	if (_ETG_Mission_Type == "Cargo_Drop") then {
			//Wrtie to RPT.log if wanted
			if (_RPT) then {
				diag_log "###ETG_HeliCrashAndDropScript by Kellojo###";
				diag_log "###Cargo drop is being created.";
				diag_log "###Spawning the helicopter...";
				diag_log format ["###Starting position:       %1",_startPos];
				diag_log format ["###Estimated drop position: %1",_ETG_Main_Coordinates];
				diag_log format ["###Used helicopter:         %1",_ETG_Heli_Type];
				diag_log "###End###";
			};

			//Create the heli and gives it a name
			_ETG_HeliCrew = createGroup East;
			[_startPos, 180,_ETG_Heli_Type, _ETG_HeliCrew] call bis_fnc_spawnvehicle;
			_ETG_Transport_Vehicle_selection = nearestObjects [_startPos, ["air"], 100];
			_ETG_Transport_Vehicle = _ETG_Transport_Vehicle_selection select 0;
			_ETG_Transport_Vehicle allowDamage false;
			
			//Disable AI
			_ETG_HeliCrew setCombatMode "BLUE";
			{
				_x disableAI "AUTOTARGET";
				_x disableAI "TARGET";
				_x disableAI "SUPPRESSION";
				removeBackpackGlobal _x;
				removeAllWeapons _x;
			} forEach units _ETG_HeliCrew;
			
			//Create marker if wanted
			if (_Debug) then {
					_marker = createMarker ["ETG_DebugMarker",[0,0,0]];
					_marker setMarkerType "o_air";
				[_ETG_Transport_Vehicle,_marker] spawn {
					sleep 10;
					_marker = _this select 1;
					_Heli = _this select 0;
					while {alive _Heli} do {
						_marker setMarkerPos position _Heli;
					};
					deleteMarker _marker;
				};
			};
			
			ETG_TransportVehicle = _ETG_Transport_Vehicle;

			//Create cargo an clear its inventory
			_ETG_Cargo = _ETG_Cargo_Type createVehicle _startPos;
			clearMagazineCargoGlobal _ETG_Cargo;
			clearWeaponCargoGlobal _ETG_Cargo;
			clearItemCargoGlobal _ETG_Cargo;
			clearBackpackCargoGlobal _ETG_Cargo;
			
			//Attaches the cargo to the transport vehicle
			_ETG_Cargo attachTo [_ETG_Transport_Vehicle, [0, 2, 0]];	
			ETG_Cargo = _ETG_Cargo;
			
			//Waypoint for the Helicopter
			_ETG_HeliWaypoint1 = _ETG_HeliCrew addWaypoint [_ETG_Main_Coordinates, 0];
			_ETG_HeliWaypoint1 setWaypointType "move";
			_ETG_HeliWaypoint1 setWaypointBehaviour "CARELESS";
			_ETG_Transport_Vehicle flyInHeight _FlyHeight;	
			_ETG_HeliWaypoint1 setWaypointStatements ['true', "ETG_HeliCrashAndDropScriptTransportVehInPosition = true;"];
			
			//sets the second waypoint
			_ETG_HeliWaypoint1 = _ETG_HeliCrew addWaypoint [[0,0,0], 0];
			_ETG_HeliWaypoint1 setWaypointType "move";
			_ETG_HeliWaypoint1 setWaypointBehaviour "CARELESS";
			_ETG_Transport_Vehicle flyInHeight _FlyHeight;	

			//waits until the distance to the drop point is > 500
			waitUntil {ETG_HeliCrashAndDropScriptTransportVehInPosition};
			_ETG_HeliCrew setCurrentWaypoint [_ETG_HeliCrew, 1];
			deleteWaypoint [_ETG_HeliCrew, 0];
			_ETG_HeliCrew setCurrentWaypoint [_ETG_HeliCrew, 1];

			//Unloading the cargo
			_ETG_Cargo attachTo [_ETG_Transport_Vehicle, [0, -15, -2] ];
			_ETG_Cargo_Position = getPos _ETG_Cargo;
			detach _ETG_Cargo;
			_ETG_Parachute = "B_Parachute_02_F" createVehicle _ETG_Cargo_Position;    
			_ETG_Parachute setPos _ETG_Cargo_Position;
			_ETG_Cargo attachTo [_ETG_Parachute, [0, 0, -1.2] ];   
			
			//Attaching a smoke grenade to the cargo
			_ETG_CargoSmoke = "SmokeShellRed"  createVehicle position _ETG_Cargo;
			_ETG_CargoSmoke attachto [_ETG_Cargo,[0,0,0]];
			sleep 10;
			_ETG_CargoSmoke setDamage 1;
			deleteVehicle _ETG_CargoSmoke;
			_ETG_CargoSmoke = "SmokeShellRed"  createVehicle position _ETG_Cargo;
			_ETG_CargoSmoke attachto [_ETG_Cargo,[0,0,0]];
			
			//Waits until cargo is close to the ground and deletes the parachute	
			waituntil {(getPos _ETG_Cargo select 2) < 4};	
			detach _ETG_Cargo;
			sleep 4;
			deleteVehicle _ETG_Parachute;
			_ETG_CargoSmoke setDamage 1;
			deleteVehicle _ETG_CargoSmoke;
			_ETG_CargoSmoke = "SmokeShellRed"  createVehicle position _ETG_Cargo;
			_ETG_CargoSmoke attachto [_ETG_Cargo,[0,0,0]];
			
			//Spawn AI if wanted
			if (_AI_Drop) then {
				_HelicrashUnits = [position _ETG_Cargo, EAST, _ETG_AIUnits,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
				//Add waypoint for the AI
				_HeliCrashGroupLeader = leader _HelicrashUnits;
				_HeliCrashUnitsGroup = group _HeliCrashGroupLeader;
				_HeliCrashUnitsGroup addWaypoint [position	_ETG_Cargo, 0];
				[_HeliCrashUnitsGroup, 0] setWaypointType "GUARD";
				[_HeliCrashUnitsGroup, 0] setWaypointBehaviour "AWARE";
				{
					removeBackpackGlobal _x;
					removeAllWeapons _x;
					_curWeapon = _ETG_Weapons call BIS_fnc_selectRandom;
					[_x,_curWeapon, 5] call BIS_fnc_addWeapon;
				} forEach units _HelicrashUnits;
		
				//delete AI after x hours
				[_DeletionDelay,_HelicrashUnits] spawn {
					sleep (_this select 0);
					{ deleteVehicle _x; } forEach units (_this select 1);
				};
			};
			
			//Create Loot
			if (_LootOnGround) then {
				//Setup variables
				_WeaponCount = 0;
				_PlannedWeaponCount = round (random _MaxWeaponCount);

				//Add random items to the crate/ground
				while {_WeaponCount < _PlannedWeaponCount} do {
					_WeaponCount = _WeaponCount + 1;
					_CurrentItem = _ETG_Weapons call BIS_fnc_selectRandom;
					_Ammount = 1;
					_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_Cargo,[], _LootSpawnRadius, "can_collide"];
					_WeaponHolder addWeaponCargoGlobal [_CurrentItem,_Ammount];	
					_magazines = getArray (configFile / "CfgWeapons" / _CurrentItem / "magazines");
					_WeaponHolder addMagazineCargoGlobal [(_magazines select 0),round random 8];
				};

				//Setup variables
				_MagazineCount = 0;
				_PlannedMagazineCount = round (random _MaxMagazineCount);
					
				//Add random items to the crate/ground
				while {_MagazineCount < _PlannedMagazineCount} do {
					_MagazineCount = _MagazineCount + 1;
					_CurrentItem = _ETG_Magazines call BIS_fnc_selectRandom;
					_Ammount = round (random _MaxAmmountOfItems);
					_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_Cargo,[], _LootSpawnRadius, "can_collide"];
					_WeaponHolder addMagazineCargoGlobal [_CurrentItem,_Ammount];	
				};

				//Setup variables
				_ItemCount = 0;
				_PlannedItemCount = round (random _MaxItemCount);
					
				//Add random items to the crate/ground
				while {_ItemCount < _PlannedItemCount} do {
					_ItemCount = _ItemCount + 1;
					_CurrentItem = _ETG_Items call BIS_fnc_selectRandom;
					_Ammount = 1;
					_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_Cargo,[], _LootSpawnRadius, "can_collide"];
					_WeaponHolder addItemCargoGlobal [_CurrentItem,_Ammount];	
				};

				//Setup variables
				_BackpackCount = 0;
				_PlannedBackpackCount = round (random _MaxBackpackCount);

				//Add random items to the crate/ground
				while {_BackpackCount < _PlannedBackpackCount} do {
					_BackpackCount = _BackpackCount + 1;
					_CurrentItem = _ETG_Backpacks call BIS_fnc_selectRandom;
					_Ammount = 1;
					_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_Cargo,[], _LootSpawnRadius, "can_collide"];
					_WeaponHolder addBackpackCargoGlobal [_CurrentItem,_Ammount];	
				};

			} else {
					
				//Setup variables
				_WeaponCount = 0;
				_PlannedWeaponCount = round (random _MaxWeaponCount);

				//Add random items to the crate/ground
				while {_WeaponCount < _PlannedWeaponCount} do {
					sleep 0.1;
					_WeaponCount = _WeaponCount + 1;
					_CurrentItem = _ETG_Weapons call BIS_fnc_selectRandom;
					_Ammount = 1;
					_magazines = getArray (configFile / "CfgWeapons" / _CurrentItem / "magazines");
					_ETG_Cargo addWeaponCargoGlobal [_CurrentItem,_Ammount];
					_ETG_Cargo addMagazineCargoGlobal [(_magazines select 0),round random 8];
				};

				//Setup variables
				_MagazineCount = 0;
				_PlannedMagazineCount = round (random _MaxMagazineCount);
					
				//Add random items to the crate/ground
				while {_MagazineCount < _PlannedMagazineCount} do {
					sleep 0.1;
					_MagazineCount = _MagazineCount + 1;
					_CurrentItem = _ETG_Magazines call BIS_fnc_selectRandom;
					_Ammount = round (random _MaxAmmountOfItems);
					_ETG_Cargo addMagazineCargoGlobal [_CurrentItem,_Ammount];	
				};

				//Setup variables
				_ItemCount = 0;
				_PlannedItemCount = round (random _MaxItemCount);
				
				//Add random items to the crate/ground
				while {_ItemCount < _PlannedItemCount} do {
					sleep 0.1;
					_ItemCount = _ItemCount + 1;
					_CurrentItem = _ETG_Items call BIS_fnc_selectRandom;
					_Ammount = 1;
					_ETG_Cargo addItemCargoGlobal [_CurrentItem,_Ammount];	
				};

				//Setup variables
				_BackpackCount = 0;
				_PlannedBackpackCount = round (random _MaxBackpackCount);

				//Add random items to the crate/ground
				while {_BackpackCount < _PlannedBackpackCount} do {
					sleep 0.1;
					_BackpackCount = _BackpackCount + 1;
					_CurrentItem = _ETG_Backpacks call BIS_fnc_selectRandom;
					_Ammount = 1;
					_ETG_Cargo addBackpackCargoGlobal [_CurrentItem,_Ammount];	
				};
			};	
	
			//More Smoke
			sleep 10;
			_ETG_CargoSmoke setDamage 1;
			deleteVehicle _ETG_CargoSmoke;
			_ETG_CargoSmoke = "SmokeShellRed"  createVehicle position _ETG_Cargo;
			_ETG_CargoSmoke attachto [_ETG_Cargo,[0,0,0]];
			_ETG_Cargo setVectorUp surfaceNormal position _ETG_Cargo;
		
			/* //Create markers if wanted - customized by TFG Canuck | Circle marker with random offset
			if (_AllowMarkers) then {
				_marker = createMarker [(getPosATL ETG_Cargo select 0) + (500 * sin floor(random 360)), (getPosATL ETG_Cargo select 1) + (500 * cos floor(random 360)), 0];
				_marker setMarkerSize [500, 500];
				_marker setMarkerShape "ELLIPSE";
				_marker setMarkerColor "ColorGrey";
				_marker setMarkerBrush "SOLID";
				_marker setMarkerAlpha 0.7;
				
				[_DeletionDelay,_marker] spawn {
					sleep (_this select 0);
					deleteMarker (_this select 1);
				};
			}; */
			
			//Create markers if wanted
			if (_AllowMarkers) then {
				_marker = createMarker [(position _ETG_Cargo) joinString " ", position _ETG_Cargo];
				_marker setMarkerType "n_service";
				
				[_DeletionDelay,_marker] spawn {
					sleep (_this select 0);
					deleteMarker (_this select 1);
				};
			};
			
			//delete supply drop after x hours
			[_DeletionDelay,_ETG_Cargo] spawn {
				sleep (_this select 0);
				deleteVehicle (_this select 1);
			};
			
			//Delete smoke - to fix the smoke bug...
			sleep 10;
			_ETG_CargoSmoke setDamage 1;
			deleteVehicle _ETG_CargoSmoke;
			
			//Delete the heli
			waituntil {_ETG_Transport_Vehicle distance [0,0,0] < 800};
			deleteVehicle _ETG_Transport_Vehicle;
				
			ETG_Cargo_Drop_Mission = 0;	
		
			//start a new cargo drop / heli crash
			sleep _SleepTime; 
			_nul = execVM _ETG_ScriptPath;
	};
	
//Run if its a heli crash
	if (_ETG_Mission_Type == "Heli_Crash") then [ {
		//Writes to the rpt file if wanted		
		if (_RPT) then {
			diag_log "###ETG_HeliCrashAndDropScript by Kellojo###";
			diag_log "###Heli crash is being created.";
			diag_log "###Spawning the helicopter...";
			diag_log format ["###Starting position:       %1",_startPos];
			diag_log format ["###Estimated drop position: %1",_ETG_Main_Coordinates];
			diag_log format ["###Used helicopter:         %1",_ETG_Heli_Type];
			diag_log "###End###";
		};
		
		//Get two more positions
		_ETG_2cnd_Coordinates = [_CenterOfMap, 1, _CenterRadius, 3, 0, 200, 0] call BIS_fnc_findSafePos;
		_ETG_3rd_Coordinates = [_CenterOfMap, 1, _CenterRadius, 3, 0, 200, 0] call BIS_fnc_findSafePos;
		
		//Create the heli and gives it a name
		_ETG_HeliCrew = createGroup East;
		[_startPos, 180,_ETG_Heli_Type, _ETG_HeliCrew] call bis_fnc_spawnvehicle;
		_ETG_Transport_Vehicle_selection = nearestObjects [_startPos, ["air"], 100];
		_ETG_Transport_Vehicle = _ETG_Transport_Vehicle_selection select 0;
		ETG_TransportVehicle = _ETG_Transport_Vehicle;
			
		//Disable AI
		_ETG_HeliCrew setCombatMode "BLUE";
		{
			_x disableAI "AUTOTARGET";
			_x disableAI "TARGET";
			_x disableAI "SUPPRESSION";
			removeBackpackGlobal _x;
			removeAllWeapons _x;
		} forEach units _ETG_HeliCrew;
			
		//Create debug marker if wanted
		if (_Debug) then {
				_marker = createMarker ["ETG_DebugMarker",[0,0,0]];
				_marker setMarkerType "o_air";
			[_ETG_Transport_Vehicle,_marker] spawn {
				sleep 10;
				_marker = _this select 1;
				_Heli = _this select 0;
				while {alive _Heli} do {
					_marker setMarkerPos position _Heli;
				};
				deleteMarker _marker;
			};
		};
				
		//Remove weapon attachments from crew
		{removeAllPrimaryWeaponItems _x; } forEach units _ETG_HeliCrew;
				
		//Waypoint for the Helicopter
		_ETG_HeliWaypoint1 = _ETG_HeliCrew addWaypoint [_ETG_Main_Coordinates, 0];
		_ETG_HeliWaypoint1 setWaypointType "move";
		_ETG_HeliWaypoint1 setWaypointBehaviour "CARELESS";
		_ETG_Transport_Vehicle flyInHeight _FlyHeight;	
		
		//sets the second waypoint
		_ETG_HeliWaypoint2 = _ETG_HeliCrew addWaypoint [_ETG_2cnd_Coordinates, 0];
		_ETG_HeliWaypoint2 setWaypointType "move";
		_ETG_HeliWaypoint2 setWaypointBehaviour "CARELESS";
		_ETG_Transport_Vehicle flyInHeight _FlyHeight;	
				
		//sets the third waypoint
		_ETG_HeliWaypoint3 = _ETG_HeliCrew addWaypoint [_ETG_3rd_Coordinates, 0];
		_ETG_HeliWaypoint3 setWaypointType "move";
		_ETG_HeliWaypoint3 setWaypointBehaviour "CARELESS";
		_ETG_Transport_Vehicle flyInHeight _FlyHeight;	
		_ETG_HeliWaypoint3 setWaypointStatements ['true', "ETG_HeliCrashAndDropScriptTransportVehInPosition = true;"];
			
		//sets the fourth waypoint
		_ETG_HeliWaypoint4 = _ETG_HeliCrew addWaypoint [[0,0,0], 0];
		_ETG_HeliWaypoint4 setWaypointType "move";
		_ETG_HeliWaypoint4 setWaypointBehaviour "CARELESS";
		_ETG_Transport_Vehicle flyInHeight _FlyHeight;	
		
		//Wait until the heli is close to its crash point and or it is damaged to a certain point
		waitUntil {(ETG_HeliCrashAndDropScriptTransportVehInPosition) || (getDammage _ETG_Transport_Vehicle > 0.2)};
	
		//Set new waypoints
		_ETG_HeliCrew setCurrentWaypoint [_ETG_HeliCrew, 3];
		deleteWaypoint [_ETG_HeliCrew, 0];
		deleteWaypoint [_ETG_HeliCrew, 1];
		_ETG_HeliCrew setCurrentWaypoint [_ETG_HeliCrew, 2];
	
		//crash the chopper...
		_ETG_Transport_Vehicle setFuel 0;
		_ETG_Transport_Vehicle setDamage 1;

		//wait until the heli is close to the ground and delete it
		waituntil {(getPos _ETG_Transport_Vehicle select 2) < 1};
		sleep 10;
		_ETG_CrashPosition = position _ETG_Transport_Vehicle;
		_ETG_CrashRot = getDir _ETG_Transport_Vehicle;
		sleep 2;
		deleteVehicle _ETG_Transport_Vehicle;
				
		ETG_CrashPosition = _ETG_CrashPosition;
		
		/* //Create markers if wanted - customized by TFG Canuck | Circle marker with random offset
			if (_AllowMarkers) then {
				_marker = createMarker [(getPosATL _ETG_CrashPosition select 0) + (500 * sin floor(random 360)), (getPosATL _ETG_CrashPosition select 1) + (500 * cos floor(random 360)), 0];
				_marker setMarkerSize [500, 500];
				_marker setMarkerShape "ELLIPSE";
				_marker setMarkerColor "ColorGrey";
				_marker setMarkerBrush "SOLID";
				_marker setMarkerAlpha 0.7;
				
				[_DeletionDelay,_marker] spawn {
					sleep (_this select 0);
					deleteMarker (_this select 1);
				};
			}; */
				
		//Create markers if wanted
		if (_AllowMarkers) then {
			_marker = createMarker [_ETG_CrashPosition joinString " ",_ETG_CrashPosition];
			_marker setMarkerType _MarkerType;
			[_DeletionDelay,_marker] spawn {
				sleep (_this select 0);
				deleteMarker (_this select 1);
			};		
		};
				
		//create the heli crash
		_ETG_CrashedHeli = createVehicle ["Land_Wreck_Heli_Attack_01_F",_ETG_CrashPosition,[], 0, "can_collide"];
		_ETG_CrashedHeli setDir _ETG_CrashRot;
		_ETG_CrashedHeli setPos [position _ETG_CrashedHeli select 0,position _ETG_CrashedHeli select 1, 0.1];
		_ETG_CrashedHeli setVectorUp surfaceNormal position _ETG_CrashedHeli;
		_ETG_SmokeEffect = createVehicle ["test_EmptyObjectForSmoke",position _ETG_CrashedHeli,[], 0, "can_collide"];
		_ETG_SmokeEffect attachTo [_ETG_CrashedHeli, [0.5, -2, 1] ];
		//Create 2 campfires at the crashsite for the light/fire effects
		if (_FireAtCrashSite) then {_ETG_FireEffect2 = createVehicle ["Campfire_burning_F",position _ETG_CrashedHeli,[], 1, "can_collide"]; _ETG_FireEffect1 = createVehicle ["Campfire_burning_F",position _ETG_CrashedHeli,[], 1, "can_collide"];
			_ETG_FireEffect1 setPos [position _ETG_FireEffect1 select 0, position _ETG_FireEffect1 select 1, -0.1];
			_ETG_FireEffect2 setPos [position _ETG_FireEffect2 select 0, position _ETG_FireEffect2 select 1, -0.1];
			[_ETG_FireEffect1,_ETG_FireEffect2,_DeletionDelay] spawn {
				sleep (_this select 2);
				deleteVehicle (_this select 0);
				deleteVehicle (_this select 1);
			};
		};

		//Make the heli accecible for other scripts
		ETG_CrashedHeli = _ETG_CrashedHeli;
				
		//Spawn AI if wanted
		if (_AI_Crash) then {
			_HelicrashUnits = [position _ETG_CrashedHeli, EAST, _ETG_AIUnits,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
			//Add waypoint for the AI
			_HeliCrashGroupLeader = leader _HelicrashUnits;
			_HeliCrashUnitsGroup = group _HeliCrashGroupLeader;
			{
				removeBackpackGlobal _x;
				removeAllWeapons _x;
				_curWeapon = _ETG_Weapons call BIS_fnc_selectRandom;
				[_x,_curWeapon, 5] call BIS_fnc_addWeapon;
			} forEach units _HelicrashUnits;
					
			//Add a waypoint for them
			_HeliCrashUnitsGroup addWaypoint [position _ETG_CrashedHeli, 0];
			[_HeliCrashUnitsGroup, 0] setWaypointType "GUARD";
			[_HeliCrashUnitsGroup, 0] setWaypointBehaviour "AWARE";
		
			//delete AI after x hours
			[_DeletionDelay,_HelicrashUnits] spawn {
				sleep (_this select 0);
				{ deleteVehicle _x; } forEach units (_this select 1);
			};
		};	
	
		//spawn crates around the crashsite, rotate them and add loot to them/the ground
		_ETG_HeliCrashLootBox1 = _ETG_HeliCrashLootBoxes call BIS_fnc_selectRandom; 
		_ETG_HeliCrashLootBoxes1 = createVehicle [_ETG_HeliCrashLootBox1,_ETG_CrashPosition,[], _CrateSpawnRadius, "can_collide"];_ETG_HeliCrashLootBoxes1 allowDamage false; clearMagazineCargoGlobal _ETG_HeliCrashLootBoxes1;clearItemCargoGlobal _ETG_HeliCrashLootBoxes1;clearBackpackCargoGlobal _ETG_HeliCrashLootBoxes1;clearWeaponCargoGlobal _ETG_HeliCrashLootBoxes1; _ETG_HeliCrashLootBoxes1 setPos [position _ETG_HeliCrashLootBoxes1 select 0,position _ETG_HeliCrashLootBoxes1 select 1, 0.1]; _ETG_HeliCrashLootBoxes1 setVectorUp surfaceNormal position _ETG_HeliCrashLootBoxes1;
		_ETG_HeliCrashLootBox2 = _ETG_HeliCrashLootBoxes call BIS_fnc_selectRandom; 
		_ETG_HeliCrashLootBoxes2 = createVehicle [_ETG_HeliCrashLootBox2,_ETG_CrashPosition,[], _CrateSpawnRadius, "can_collide"];_ETG_HeliCrashLootBoxes2 allowDamage false; clearMagazineCargoGlobal _ETG_HeliCrashLootBoxes2;clearItemCargoGlobal _ETG_HeliCrashLootBoxes2;clearBackpackCargoGlobal _ETG_HeliCrashLootBoxes2;clearWeaponCargoGlobal _ETG_HeliCrashLootBoxes2; _ETG_HeliCrashLootBoxes2 setPos [position _ETG_HeliCrashLootBoxes2 select 0,position _ETG_HeliCrashLootBoxes2 select 1, 0.1]; _ETG_HeliCrashLootBoxes2 setVectorUp surfaceNormal position _ETG_HeliCrashLootBoxes2;
		_ETG_HeliCrashLootBox3 = _ETG_HeliCrashLootBoxes call BIS_fnc_selectRandom; 
		_ETG_HeliCrashLootBoxes3 = createVehicle [_ETG_HeliCrashLootBox3,_ETG_CrashPosition,[], _CrateSpawnRadius, "can_collide"];_ETG_HeliCrashLootBoxes3 allowDamage false; clearMagazineCargoGlobal _ETG_HeliCrashLootBoxes3;clearItemCargoGlobal _ETG_HeliCrashLootBoxes3;clearBackpackCargoGlobal _ETG_HeliCrashLootBoxes3;clearWeaponCargoGlobal _ETG_HeliCrashLootBoxes3; _ETG_HeliCrashLootBoxes3 setPos [position _ETG_HeliCrashLootBoxes3 select 0,position _ETG_HeliCrashLootBoxes3 select 1, 0.1]; _ETG_HeliCrashLootBoxes3 setVectorUp surfaceNormal position _ETG_HeliCrashLootBoxes3;
	
	
		//Add loot to them
		if (_LootOnGround) then {
			//Setup variables
			_WeaponCount = 0;
			_PlannedWeaponCount = round (random _MaxWeaponCount);

			//Add random items to the crate/ground
			while {_WeaponCount < _PlannedWeaponCount} do {
				_WeaponCount = _WeaponCount + 1;
				_CurrentItem = _ETG_Weapons call BIS_fnc_selectRandom;
				_Ammount = 1;
				_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_HeliCrashLootBoxes1,[], _LootSpawnRadius, "can_collide"];
				_WeaponHolder addWeaponCargoGlobal [_CurrentItem,_Ammount];
				_magazines = getArray (configFile / "CfgWeapons" / _CurrentItem / "magazines");
				_WeaponHolder addMagazineCargoGlobal [(_magazines select 0),round random 8];
			};

			//Setup variables
			_MagazineCount = 0;
			_PlannedMagazineCount = round (random _MaxMagazineCount);
		
			//Add random items to the crate/ground
			while {_MagazineCount < _PlannedMagazineCount} do {
				_MagazineCount = _MagazineCount + 1;
				_CurrentItem = _ETG_Magazines call BIS_fnc_selectRandom;
				_Ammount = round (random _MaxAmmountOfItems);
				_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_HeliCrashLootBoxes2,[], _LootSpawnRadius, "can_collide"];
				_WeaponHolder addMagazineCargoGlobal [_CurrentItem,_Ammount];	
			};

			//Setup variables
			_ItemCount = 0;
			_PlannedItemCount = round (random _MaxItemCount);
	
			//Add random items to the crate/ground
			while {_ItemCount < _PlannedItemCount} do {
				_ItemCount = _ItemCount + 1;
				_CurrentItem = _ETG_Items call BIS_fnc_selectRandom;
				_Ammount = 1;
				_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_HeliCrashLootBoxes3,[], _LootSpawnRadius, "can_collide"];
				_WeaponHolder addItemCargoGlobal [_CurrentItem,_Ammount];	
			};

			//Setup variables
			_BackpackCount = 0;
			_PlannedBackpackCount = round (random _MaxBackpackCount);

			//Add random items to the crate/ground
			while {_BackpackCount < _PlannedBackpackCount} do {
				_BackpackCount = _BackpackCount + 1;
				_CurrentItem = _ETG_Backpacks call BIS_fnc_selectRandom;
				_Ammount = 1;
				_WeaponHolder = createVehicle ["groundweaponHolder",position _ETG_HeliCrashLootBoxes2,[], _LootSpawnRadius, "can_collide"];
				_WeaponHolder addBackpackCargoGlobal [_CurrentItem,_Ammount];	
			};
		} else {
		
			//Setup variables
			_WeaponCount = 0;
			_PlannedWeaponCount = round (random _MaxWeaponCount);

			//Add random items to the crate/ground
			while {_WeaponCount < _PlannedWeaponCount} do {
				sleep 0.1;
				_WeaponCount = _WeaponCount + 1;
				_CurrentItem = _ETG_Weapons call BIS_fnc_selectRandom;
				_Ammount = 1;
				_ETG_HeliCrashLootBoxes1 addWeaponCargoGlobal [_CurrentItem,_Ammount];	
				_magazines = getArray (configFile / "CfgWeapons" / _CurrentItem / "magazines");
				_ETG_HeliCrashLootBoxes1 addMagazineCargoGlobal [(_magazines select 0),round random 8];
			};

			//Setup variables
			_MagazineCount = 0;
			_PlannedMagazineCount = round (random _MaxMagazineCount);
				
			//Add random items to the crate/ground
			while {_MagazineCount < _PlannedMagazineCount} do {
				sleep 0.1;
				_MagazineCount = _MagazineCount + 1;
				_CurrentItem = _ETG_Magazines call BIS_fnc_selectRandom;
				_Ammount = round (random _MaxAmmountOfItems);
				_ETG_HeliCrashLootBoxes2 addMagazineCargoGlobal [_CurrentItem,_Ammount];
			};

			//Setup variables
			_ItemCount = 0;
			_PlannedItemCount = round (random _MaxItemCount);
				
			//Add random items to the crate/ground
			while {_ItemCount < _PlannedItemCount} do {
				sleep 0.1;
				_ItemCount = _ItemCount + 1;
				_CurrentItem = _ETG_Items call BIS_fnc_selectRandom;
				_Ammount = 1;
				_ETG_HeliCrashLootBoxes3 addItemCargoGlobal [_CurrentItem,_Ammount];
			};

			//Setup variables
			_BackpackCount = 0;
			_PlannedBackpackCount = round (random _MaxBackpackCount);

			//Add random items to the crate/ground
			while {_BackpackCount < _PlannedBackpackCount} do {
				sleep 0.1;
				_BackpackCount = _BackpackCount + 1;
				_CurrentItem = _ETG_Backpacks call BIS_fnc_selectRandom;
				_Ammount = 1;
				_ETG_HeliCrashLootBoxes2 addBackpackCargoGlobal [_CurrentItem,_Ammount];	
			};
		};	
	
		//Allow damage on the crates
		_ETG_HeliCrashLootBoxes1 allowDamage true;
		_ETG_HeliCrashLootBoxes2 allowDamage true;
		_ETG_HeliCrashLootBoxes3 allowDamage true;
		
		//Delete Crates at heli crashes if wanted
		if (_CratesAtCrashes) then {} else {
			deleteVehicle _ETG_HeliCrashLootBoxes1;
			deleteVehicle _ETG_HeliCrashLootBoxes1;
			deleteVehicle _ETG_HeliCrashLootBoxes1;
		};
	
		//delete heli after x hours
		[_ETG_CrashedHeli,_ETG_SmokeEffect,_ETG_HeliCrashLootBoxes1,_ETG_HeliCrashLootBoxes2,_ETG_HeliCrashLootBoxes3,_DeletionDelay] spawn {
			sleep (_this select 5);
			_ETG_CrashedHeli = _this select 0;
			//delete smoke
			{if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach (_ETG_CrashedHeli nearObjects 5); 
			deleteVehicle (_this select 0);
			(_this select 1) setDamage 1;
			deleteVehicle (_this select 1);
			deleteVehicle (_this select 2);
			deleteVehicle (_this select 3);
			deleteVehicle (_this select 4);
		};
		
		ETG_Cargo_Drop_Mission = 0;	
		
		//start a new cargo drop / heli crash
		sleep _SleepTime; 
		_nul = execVM _ETG_ScriptPath;
		}, {} ];	
	} else {sleep _SleepTime; _nul = execVM _ETG_ScriptPath;};	
};