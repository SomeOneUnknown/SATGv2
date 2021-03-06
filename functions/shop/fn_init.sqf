if (isServer) then {
	missionNamespace setVariable ["shopMul", 1, True];
	
	// UPDATE ASSORT
	[] spawn {
		while {true} do {
			call SATGv2_Shop_fnc_Update;
			sleep 1800;
			["ShopInfo",[localize "str_SATGv2_shopUpdated"]] remoteExec ["bis_fnc_showNotification"];
		};
	};
	
	// SALES
	[] spawn {
		while {true} do {
			sleep 1200;
			if (random 1 > 0.7) then {
				_sales = random 0.5;
				["ShopInfo",[Format [localize "str_SATGv2_shopSales", round (_sales * 100), "%"]]] remoteExec ["bis_fnc_showNotification"];
				missionNamespace setVariable ["shopMul", 1 - _sales, True];
				sleep 600;
				["ShopInfo",[localize "str_SATGv2_shopSalesEnd"]] remoteExec ["bis_fnc_showNotification"];
				missionNamespace setVariable ["shopMul", 1, True];
			};
		};
	};
	
	[[trader, "SIT2", "ASIS"], BIS_fnc_ambientAnim] remoteExec ["call"];
};

if (hasInterface) then {
	trader addAction [localize "str_SATGv2_shopAction", {createDialog "shopUnified"}];
	trader addAction [localize "str_SATGv2_shopTeaAction", {[] spawn SATGv2_fnc_skipTime}];
	tableTool addAction [localize "str_SATGv2_shopToolsAction", {[] spawn SATGv2_fnc_toolkitBuy}];
	tableAmmo addAction [localize "str_SATGv2_shopAmmoAction", {[] spawn SATGv2_fnc_ammoBuy}];	
};