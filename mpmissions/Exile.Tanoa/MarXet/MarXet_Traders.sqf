/*
*
*  MarXet_Traders.sqf
*  Author: WolfkillArcadia
*  © 2016 Arcas Industries
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_traders","_trader"];
_traders = [];
switch (toLower worldName) do {
	case "altis":
    {
		//////////////////////////////////////////////////////////
        // 			MarXet Trader 1
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [9890.64,9402.02,0.00473785],
            0
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;

		//////////////////////////////////////////////////////////
        //			 MarXet Trader 2
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [12506.5,2444.08,0.00317669],
            313.441
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;

		//////////////////////////////////////////////////////////
        // 			MarXet Trader 3
        ////////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [2107.53,3449.09,0.00143909],
            345.972
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;
		
		
		//////////////////////////////////////////////////////////
        // 			MarXet Trader 4
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [2633.43,11659,0.00104523],
            339.41
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;
    };
    case "namalsk":
    {
		//////////////////////////////////////////////////////////
        // 			MarXet Trader 4
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [2633.43,11659,0.00104523],
            339.41
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;

		//////////////////////////////////////////////////////////
		// 			Northern Boat MarXet Trader
		//////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [9131.12,10084.1,7.10316],
            208.937
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;

		//////////////////////////////////////////////////////////
		// 			Southern Boat MarXet Trader
		//////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [4353.53,4743.87,0.00144696],
            50.5659
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;
    };
};

		//////////////////////////////////////////////////////////
        // 			MarXet Trader 1
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [9890.64,9402.02,0.00473785],
            0
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;

		//////////////////////////////////////////////////////////
        //			 MarXet Trader 2
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [12563.3,2469.94,0.916439],
			213.763
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;

		//////////////////////////////////////////////////////////
        // 			MarXet Trader 3
        ////////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [2153.95,3468.63,0.00143909],
			345.972
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;
		
		
		//////////////////////////////////////////////////////////
        // 			MarXet Trader 4
        //////////////////////////////////////////////////////////
        _trader =
        [
            "Exile_Cutscene_Prisoner01",
            "GreekHead_A3_01",
            ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
            [2651.85,11699.5,-0.000312805],
			255.999
        ]
        call ExileClient_object_trader_create;

		_traders pushBack _trader;

{
	_x forceAddUniform "U_BG_Guerilla2_1";
	_x addVest "Exile_Vest_Snow";
	_x addHeadgear "H_Watchcap_blk";
	_x addGoggles "G_Bandanna_aviator";
	_x addWeapon "srifle_DMR_04_F";
	_x addPrimaryWeaponItem "optic_LRPS";
	_x addWeapon "hgun_ACPC2_F";
	_x addAction ["<img image='\a3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa' size='1' shadow='false' />Access MarXet","createDialog 'RscMarXetDialog'","",1,false,true,"","((position player) distance _target) <= 4"];
} forEach _traders;
