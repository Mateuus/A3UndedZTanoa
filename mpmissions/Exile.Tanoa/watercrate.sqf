//All CREDIT GOES TO ORGINAL OWNERS AND MODIFIERS//
//Random Loot Crates by Darth_Rogue & Chisel (tdwhite)  
//HUGE thanks to deadeye & Robio for helping work out the last bugs!
//////////////////////////////////////////////////////////////////////
// Modified by Tuna to only spawn in water on out skirts of map


//watercrate.sqf

if (isServer) then {
_numberofcrates = 3;  //  Number of crates around the map
_spawnCenter = [7866.108,7541.369,0]; 
//_spawnCenter = getmarkerpos "center"; // Use this if you want the global center of the map, it's declared in mission.sqm, island specific

_min = 3000; // minimum distance from the center position (Number) in meters

_max = 8000; // maximum distance from the center position (Number) in meters
// _max = 3; // Example : maximum range of spawned crates, to keep them INSIDE the sector B compound

_mindist = 1; // minimum distance from the nearest object (Number) in meters, ie. spawn at least this distance away from anything within x meters..
_water = 2; // water mode (Number)    0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; // 0: does not have to be at a shore , 1: must be at a shore
_marker = True; // Draw a green circle in which the crate will be spawned randomly
_markersize = 100; // Radius of the marker in meters

diag_log format['Starting spawncrates.sqf'];

for "_i" from 1 to _numberofcrates do
  {
    _pos = [_spawnCenter,_min,_max,_mindist,_water,800,_shoremode] call BIS_fnc_findSafePos; // find a random location within range

    if (_marker) then {
        _event_marker = createMarker [ format ["loot_marker_%1", _i], _pos];
        _event_marker setMarkerShape "ELLIPSE";
		_event_marker setMarkerBrush "Solid";
        _event_marker setMarkerColor "ColorRed";
        _event_marker setMarkerAlpha 0.45;
        _event_marker setMarkerSize [(_markersize+15), (_markersize+15)]; //green circle slightly bigger , box can spawn just outside if not increased
      
        _pos = [_pos select 0, _pos select 1, 0];
    };    

    diag_log format['Spawncrate %1 : Location %2',_i,_pos];

    _box = "Box_NATO_Wps_F" createvehicle _pos;   //create the crate  .. These ARE liftable with chopper like the CH-67 , but will not stay after restarts !
   
    clearMagazineCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
    _box setVariable ["permaLoot",true]; //stay until reset
    _box allowDamage false; // Prevent boxes to explode when spawning
     // Add items to the crate        Ex. 2 + random 2 = possible 4   ///  random 8 possible 1-8 items 
    _box addItemCargoGlobal ["Exile_Item_DuctTape", 2 + (random 2)];
    _box addItemCargoGlobal ["Exile_Item_JunkMetal",  (random 5)]; 
    _box addItemCargoGlobal ["Exile_Item_MetalPole",  (random 4)]; 
	_box addItemCargoGlobal ["Exile_Item_WoodFloorKit", 2 + (random 2)];
	_box addItemCargoGlobal ["Exile_Item_WoodPlank", 3 + (random 3)];
	_box addItemCargoGlobal ["Exile_Item_WoodWallKit",  (random 4)];
	_box addItemCargoGlobal ["Exile_Item_InstaDoc", 1 + (random 2)];
	_box addItemCargoGlobal ["Exile_Item_FortificationUpgrade",  (random 2)];
	_box addItemCargoGlobal ["Exile_Item_BBQSandwich_Cooked", 1 + (random 2)];
	_box addItemCargoGlobal ["Exile_Item_Energydrink", 1 + (random 3)];
	_box addWeaponCargoGlobal ["srifle_LRR_camo_F",  (random 2)];
	_box addWeaponCargoGlobal ["arifle_SDAR_F", 1 + (random 2)];
	_box addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3 + (random 5)];
    _box addItemCargoGlobal ["Exile_Item_Bandage", 1 + (random 5)];	
	_box addMagazineCargoGlobal ["150Rnd_93x64_Mag", (random 2)];
	_box addMagazineCargoGlobal ["130Rnd_338_Mag", (random 2)];
	//More Loot
	_box addWeaponCargoGlobal ["srifle_GM6_camo_F",  (random 1)];
	_box addWeaponCargoGlobal ["MMG_02_sand_F", 1 + (random 1)];
	_box addWeaponCargoGlobal ["srifle_DMR_02_sniper_F",  (random 1)];
	_box addWeaponCargoGlobal ["srifle_EBR_F", 1 + (random 1)];
	_box addWeaponCargoGlobal ["launch_Titan_short_F", (random 1)];
	_box addWeaponCargoGlobal ["launch_RPG32_F", (random 1)];
    
  }
};