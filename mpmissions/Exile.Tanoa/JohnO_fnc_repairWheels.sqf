/**
 * ExileClient_object_vehicle_repair
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_availableHitpoints","_fixable","_equippedMagazines","_wheels","_brokenWheels","_randomWheel","_repairable","_wheelToRepair"];
_vehicle = _this select 0;
/*if (ExileClientPlayerIsInCombat) exitWith
{
	["RepairFailedWarning", ["You are in combat!"]] call ExileClient_gui_notification_event_addNotification;
};*/
if (vehicle player isEqualTo _vehicle) exitWith 
{
	["RepairFailedWarning", ["Are you serious?"]] call ExileClient_gui_notification_event_addNotification;
};
_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
{
	if((_vehicle getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;

_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"]; 
_broken = [];
{
	if ((_vehicle getHitPointDamage _x) > 0) then
	{	
		_damage = _vehicle getHitPointDamage _x;
		_broken = _broken + [[_damage,_x]]; 
	};
} forEach _wheels;

_broken sort false;

_wheelToRepair = (_broken select 0) select 1;

if (_broken isEqualTo []) exitWith
{
	["RepairFailedWarning", ["The wheels do not need repair"]] call ExileClient_gui_notification_event_addNotification;
};
if (!local _vehicle) then
{
	["RepairFailedWarning", ["Please get in as driver/pilot first."]] call ExileClient_gui_notification_event_addNotification;
}
else 
{
	_equippedMagazines = magazines player;
	
	if ("Exile_Item_Foolbox" in _equippedMagazines) then
	{		
		if ("Exile_Item_CarWheel" in _equippedMagazines) then
			{				
				player playMove "AinvPknlMstpSnonWnonDr_medic3";		
				sleep 10;
				_vehicle setHitPointDamage [_wheelToRepair,0];
				player removeItem "Exile_Item_CarWheel";
				["Success",["You have repaired a wheel"]] call ExileClient_gui_notification_event_addNotification;
			}
		else
		{
			["RepairFailedWarning", ["You need a wheel"]] call ExileClient_gui_notification_event_addNotification;
		};		
	}
	else
	{
		["RepairFailedWarning", ["You need a toolbox"]] call ExileClient_gui_notification_event_addNotification;
	};
	
};
true
/*
_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"]; 
_broken = [];
{
	if ((bob getHitPointDamage _x) > 0) then
	{	
		_damage = bob getHitPointDamage _x;
		_broken = _broken + [[_damage,_x]]; 
	};
} forEach _wheels;

_broken sort false;

_wheelToRepair = (_broken select 0) select 1;
bob setHitPointDamage [_wheelToRepair,0];

bob setHitPointDamage 

hint str _broken;

hint str _broken

_damagedWheels = [];

{
	if (bob getHitPointDamage _x) then
	
	
} forEach _broken;

_damagedWheels sort false;

hint str _damagedWheels;
_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];   _broken = [];  {   if ((bob getHitPointDamage _x) > 0) then   {     _damage = bob getHitPointDamage _x;    _broken = _broken + [[_x,_damage]];    };  } forEach _wheels;  hint str _broken