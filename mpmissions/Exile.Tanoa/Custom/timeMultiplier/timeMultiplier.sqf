if (!isServer) exitWith {};

while {true} do
{
	if (daytime >= 20 || daytime < 6) then
	{
		setTimeMultiplier 24;
	}
	else
	{
		setTimeMultiplier 6;
	};

	uiSleep 60;
};