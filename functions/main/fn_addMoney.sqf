	params ["_count"];
	
	_money = profileNamespace setVariable ["SATGMoney", (profileNamespace getVariable ["SATGMoney", 0]) + _count];
	//[_count] spawn FNC_showMoney;
	[_count] spawn HUD_showMoney;
	
	playSound "money";