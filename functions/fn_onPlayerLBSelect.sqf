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
	[_unit] call A3G_Spectatorcam_fnc_focusUnit;
	closeDialog 0;
};

true