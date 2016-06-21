disableSerialization;
_dsp = uiNamespace getVariable ["RscDisplayServerInfoMenu", displayNull];
if not isNull _dsp then
{
   _cfgPath = (missionConfigFile >> "CfgServerInfoMenu");
   _ctrlServerName = _dsp displayCtrl 0;
   _ctrlServerName ctrlSetText getText(_cfgPath >> "serverName");
   _ctrlIpPort = _dsp displayCtrl 1;
   _ctrlIpPort ctrlSetText getText(_cfgPath >> "ipPort");
   _ctrlRestart = _dsp displayCtrl 4;
   _ctrlRestart ctrlSetText format["RESTART EVERY %1 HOURS", getNumber(_cfgPath >> "restart")];
   _ctrlHostedBy = _dsp displayCtrl 5;
   _ctrlHostedBy ctrlSetText format["HOSTED BY: %1", getText(_cfgPath >> "hostedBy")];
   _ctrlantiHACK = _dsp displayCtrl 6;
   _ctrlantiHACK ctrlSetText format["ANTIHACK: %1", getText(_cfgPath >> "antiHACK")];
   _listBox = _dsp displayCtrl 7;
   _listBoxItems = "isClass _x" configClasses (missionConfigFile >> "CfgServerInfoMenu" >> "menuItems");
   {
      _listBox lbAdd (toUpper (configName _x));
   } forEach _listBoxItems;

   _dsp spawn
   {
      disableSerialization;
      _dsp = _this;
      _ctrlUptime = _dsp displayCtrl 2;
      _ctrlPlayerCount = _dsp displayCtrl 3;
      while {true} do
      {
         scopeName "loop";
         if not isNull _dsp then
         {
            _hours = serverTime / 3600;
            _minutes = (_hours - floor _hours);
            _uptime = format["%1h%2m", floor _hours, floor (_minutes * 60)];
            _ctrlUptime ctrlSetText _uptime;

            _ctrlPlayerCount ctrlSetText str(count allPlayers);
            uiSleep 2;
         } else
         {
            breakOut "loop";
         };
      };
   };

   {
      _x ctrlSetFade 0;
      _x ctrlCommit 0.1;
      playSound ["ReadOutClick", true];
      uiSleep 0.1;
   } forEach (allControls _dsp);
   _listBox lbSetCurSel 0;
};