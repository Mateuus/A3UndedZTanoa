if(isDedicated) exitWith {};

_sizeTitle          = 0.80; // Font Size of the Title Messages
_sizeSubText        = 0.50;  // Font Size of the SubTitle Messages
_colorTitle         = "#D6A454"; // HTML Color Code of the Title Messages (must start with '#' )
_colorSubText       = "#FFFFFF"; // HTML Color Code of the SubTitle Messages (must start with '#' )
_alignTitle         = "left"; // Alignment of the Title Message (right or left)
_alignSubText       = "left"; // Alignment of the SubTitle Message (right or left)
_fontTitle          = "PuristaBold"; // Font Type Of Title Messages
_fontSubText        = "PuristaMedium"; // Font Type Of SubTitle Messages
_shadowTitle		= "2"; // Enable shadow on Title Messages - 0 = off / 1 = regular shadow / 2 = text outline
_shadowSubText		= "2"; // Enable shadow on SubTitle Messages - 0 = off / 1 = regular shadow / 2 = text outline
_shadowColor		= "#000000"; // Sets the color of the shadow / outline


_Delay                = 5; // Wait in seconds before the credits start after player IS ingame
_FadeIn             = 1; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role


_IntroMusic            = false; // Welcome Intro Song During the credits (true or false)


_posDefault         = [0.025,0.3,0.7]; // Defualt Positions of all Credits



// First
_title				= format ["Seja bem-vindo %1",name player];
_shorttext			= "Tanoa UndeadZ Exile by Undead Brasil Servidores";
_posText        	= [0.025,0.3,0.7];


_title2				= "Informações";
_shorttext2			= "Server information and rules can be found<br />in the xm8 app - Server Info.";
_posText2			= [0.025,0.3,0.7];


_title3				= "Respect other players";
_shorttext3			= "The admins are always watching";
_posText3			= [0.025,0.3,0.7];


/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/*                                        /!\ DO NOT EDIT BELOW THIS LINE. DO NOT REMOVE CREDITS /!\
/*
/*                                            SCRIPTING BY:        GR8 [GhostzGamerz.com]
/*                                            VERSION:            2.1
/*                                            DATE:            20 AUGUST 2015
/*
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
_ms = [];
for "_i" from 1 to 50 do
{
    _t = if (_i!=1) then { format["_title%1",_i] } else { "_title" };
    _s = if (_i!=1) then { format["_shorttext%1",_i] } else { "_shorttext" };
    _p = if (_i!=1) then { format["_postext%1",_i] } else { "_postext" };
    if (!isNil _t or !isNil _s) then
    {
        _at = if (!isNil _t) then { call compile _t } else { "" };
        _as = if (!isNil _s) then { call compile _s } else { "" };
        _ap = if (!isNil _p) then { call compile _p } else { _posDefault };
        _ms = _ms + [[_at,_as,_ap]];
    }
};
waitUntil{sleep 1; ExileClientPlayerIsSpawned}; 
waitUntil{player == player};
sleep _Delay;
if (_IntroMusic) then { playMusic "intro";};
player enableSimulation true;
{
    _t = _x select 0;
    _s = _x select 1;
    _pX = _x select 2 select 0;
    _pY = _x select 2 select 1;
    _pW = _x select 2 select 2;
    _m = format ["<t shadow='%6' shadowColor='%7' size='%1' color='%2' align='%3' font='%4'>%5<br /></t>", _sizeTitle, _colorTitle, _alignTitle, _fontTitle, _t, _shadowTitle, _shadowColor];
    _m = _m + format ["<t shadow='%6' shadowColor='%7' size='%1' color='%2' align='%3' font='%4'>%5<br /></t>", _sizeSubText, _colorSubText, _alignSubText, _fontSubText, _s, _shadowSubText, _shadowColor];
    _tm = round (count toArray (_t+_s) / 6 / 2) + 3;
    [ _m, [_pX * safeZoneW + safeZoneX, _pW], [_pY * safezoneH + safezoneY, 1 * safezoneH + safezoneY], _tm, _FadeIn ] spawn BIS_fnc_dynamicText;
    sleep (_tm+_FadeIn+4);
} forEach _ms; 