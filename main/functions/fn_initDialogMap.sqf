#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_dialog", "_listPlayers", "_map"];

_display = _this select 0;
_listPlayers = _display displayCtrl 1;
_map = _display displayCtrl 2;

{
	if (!(isNil QGVAR(spectatorGroup))) then {
		if (!(_x in (units GVAR(spectatorGroup)))) then {
			_listPlayers lbAdd (name _x);
		};
	} else {
		_listPlayers lbAdd (name _x);
	};
} foreach playableUnits;