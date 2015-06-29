private ["_drawColor", "_text"];

if (A3G_Spectatorcam_set_showUI) then {
	showCinemaBorder false;
	cameraEffectEnableHUD true;
	{
		if !(side group _x == civilian) then {
			if (A3G_Spectatorcam_set_markEnemies || A3G_Spectatorcam_var_playerSide getFriend (side group _x) > 0.6) then {
				if (A3G_Spectatorcam_var_cameraObject distance _x < 500) then {
					_drawColor = [0,0,0,0];
					switch (side group _x) do {
						case west: {
							_drawColor = [0,0.3,0.6,0.5];
						};
						case east: {
							_drawColor = [0.5,0,0,0.5];
						};
						case independent: {
							_drawColor = [0,0.5,0,0.5];
						};
					};

					if (isPlayer _x && A3G_Spectatorcam_var_cameraObject distance _x < 20) then {
						_text = name _x;
					} else {
						_text = "";
					};

					if !(captive _x) then {
						drawIcon3D ["\a3\ui_f\data\map\Markers\Military\dot_ca.paa", _drawColor, (visiblePosition _x) vectorAdd [0, 0, 2], 1, 1, 0, _text, 0, 0.04, "PuristaBold"];
					} else {
						drawIcon3D ["\a3\ui_f\data\map\MapControl\tree_ca.paa", _drawColor, (visiblePosition _x) vectorAdd [0, 0, 2], 0.5, 0.5, 0, _text, 0, 0.04, "PuristaBold"];
					};
				} else {
					if (isFormationLeader _x) then {
						switch (side group _x) do {
							case west: {
								drawIcon3D ["\A3\ui_f\data\map\Markers\NATO\b_unknown.paa", [0,0.3,0.6,0.5], visiblePosition _x, 1, 1, 0];
							};
							case east: {
								drawIcon3D ["\A3\ui_f\data\map\Markers\NATO\o_unknown.paa", [0.5,0,0,0.5], visiblePosition _x, 1, 1, 0];
							};
							case independent: {
								drawIcon3D ["\A3\ui_f\data\map\Markers\NATO\n_unknown.paa", [0,0.5,0,0.5], visiblePosition _x, 1, 1, 0];
							};
						};
					};
				};
			};
		};
	} foreach allUnits;

	if (A3G_Spectatorcam_var_inSelectionMode) then {
		if (!(isNil "A3G_Spectatorcam_var_currentSelection") && !(isNull A3G_Spectatorcam_var_currentSelection)) then {
			drawIcon3D ["\a3\ui_f\data\map\Markers\Military\circle_ca.paa", [1,1,1,1], (A3G_Spectatorcam_var_currentSelection  selectionPosition "pelvis") vectorAdd (visiblePosition A3G_Spectatorcam_var_currentSelection), 1.5, 1.5, 0, "", 0, 0.04, "PuristaBold"];
		};
	};
} else {
	cameraEffectEnableHUD false;
};