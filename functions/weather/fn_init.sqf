if (hasInterface) then {
	[objNull, 8] exec "THIRSK_Snow.sqs";
};

if (isServer) then {
	setTimeMultiplier 4;
	thirsk_snowdens = 0;
	0 setFog [1, 0];
		[] spawn {
			if (objNull isEqualTo (profileNamespace getVariable ["SATGv2_World", objNull])) then {
				0 setOvercast 1;
			} else {
				call SATGv2_Weather_fnc_load;
			};
			forceWeatherChange;
			
			[] spawn SATGv2_Weather_fnc_Changer;
			
			while {true} do {
				call SATGv2_Weather_fnc_fogAndSnow;
				sleep 60;
			};
	};
};