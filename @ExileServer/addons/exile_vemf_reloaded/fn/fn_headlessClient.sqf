/*
    Author: IT07

    Description:
    selects a headless client with least (VEMFr) load

    Params:
    None

    Returns:
    OBJECT - the headless client
*/

private ["_hasLowest"];
if (("headLessClientSupport" call VEMFr_fnc_getSetting) isEqualTo 1) then
   { // Ok, Headless Clients enabled. let us continue
      private ["_hcList","_ingameHCs"];
      _hcList = "headLessClientNames" call VEMFr_fnc_getSetting;
      // We have the names now, check if any of them is actually ingame
      _ingameHCs = [];
      {
         if (side _x isEqualTo sideLogic AND _x in _hcList) then
            {
               _ingameHCs pushBack [_x, name _x];
            };
      } forEach allPlayers;
      if (count _ingameHCs > 0) then
         { // At least 1 of given headless clients is ingame, lets check their load
            private ["_globalLoad","_lowestLoad","_hasLowest"];
            _globalLoad = uiNamespace getVariable "VEMFrHcLoad";
            _lowestLoad = 99999;
            _hasLowest = "";
            private ["_load"];
            { // Find the lowest load number
               _load = _x select 1;
               if (_load < _lowestLoad) then
                  {
                     _lowestLoad = _load;
                     _hasLowest = _x select 0;
                  };
            } forEach _globalLoad;
            private ["_index"];
            // HC with lowest load found, add +1 to its current load
            _index = _globalLoad find [_hasLowest, _lowestLoad];
            if (_index > -1) then
               {
                  _globalLoad set [_index,[_hasLowest, _lowestLoad +1]]
               };
         } else
         {
            ["fn_headlessClient", 0, "Unable to find any ingame Headless Client(s)"] spawn VEMFr_fnc_log;
         };
   } else
   {
      ["fn_headLessClient", 0, "Can not run. headLessClientSupport is not enabled"] ExecVM "exile_vemf_reloaded\sqf\log.sqf";
   };

   // Lowest load found, send it
   if not isNil "_hasLowest" then
      {
         _hasLowest
      } else
      {
         ["fn_headlessClient", 0, "Unable to find HC with lowest load..."] spawn VEMFr_fnc_log;
      };
