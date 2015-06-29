#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_listbox", "_index", "_player", "_unit"];

_listbox = _this select 0;
_index = _this select 1;

_player = _listbox lbText _index;

{
	if (name _x == _player) exitWith {
		_unit = _x;
	};
} foreach playableUnits;

if (isNil "_unit" || isNull _unit) then {
	_listbox lbDelete _index;
} else {
	[_unit] call FUNC(focusUnit);
	closeDialog 0;
};

true