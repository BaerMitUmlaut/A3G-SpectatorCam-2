private ["_map", "_drawColor", "_text"];

_map = _this select 0;

{
	if !(side group _x == civilian) then {
		if (A3G_Spectatorcam_set_markEnemies || A3G_Spectatorcam_var_playerSide getFriend (side group _x) > 0.6) then {
			_drawColor = [0,0,0,0];
			switch (side group _x) do {
				case west: {
					_drawColor = [0,0.3,0.6,1];
				};
				case east: {
					_drawColor = [0.5,0,0,1];
				};
				case independent: {
					_drawColor = [0,0.5,0,1];
				};
			};

			if (isPlayer _x && A3G_Spectatorcam_var_cameraObject distance _x < 20) then {
				_text = name _x;
			} else {
				_text = "";
			};

			if !(captive _x) then {
				_map drawIcon ["\a3\ui_f\data\map\Markers\Military\dot_ca.paa", _drawColor, (getPosATL _x), 40, 40, 0, _text, 0, 0.04, "PuristaBold"];
			} else {
				_map drawIcon ["\a3\ui_f\data\map\MapControl\tree_ca.paa", _drawColor, (getPosATL _x), 20, 20, 0, _text, 0, 0.04, "PuristaBold"];
			};
		};
	};
} foreach allUnits;

true