#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_screenPosSelection", "_screenPosUnits", "_screenPosCurrent", "_absDistance"];

_screenPosSelection = [(_this select 1), (_this select 2), 0];
_screenPosUnits = [];

{
	_screenPosCurrent = worldToScreen (getPos _x);
	if (count _screenPosCurrent > 0) then {
		_screenPosCurrent pushBack 0; //Z coordinate is needed for vector calculation
		_absDistance = vectorMagnitude (_screenPosSelection vectorDiff _screenPosCurrent);
		_screenPosUnits pushBack [_absDistance, _x];
	};
} foreach allUnits;

if (count _screenPosUnits > 0) then {
	_screenPosUnits sort true;
	if (((_screenPosUnits select 0) select 0) < (0.05 * safeZoneW)) then {
		GVAR(currentSelection) = (_screenPosUnits select 0) select 1;
	} else {
		GVAR(currentSelection) = objNull;
	};
} else {
	GVAR(currentSelection) = objNull;
};

true