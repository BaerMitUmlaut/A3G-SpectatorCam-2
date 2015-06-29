/*
 * Author: BlauBär
 * Calculates the directional and up vector for a certain pitch and angle.
 *
 * Arguments:
 * 0: Direction/Angle <NUMBER>
 * 1: Pitch <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [180, -45] call A3GSC_fnc_calcVectorDirAndUp;
 *
 */

#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_dir", "_pitch", "_vecdx", "_vecdy", "_vecdz", "_vecuz"];

_dir = _this select 0;
_pitch = _this select 1;

_vecdx = sin(_dir) * cos(_pitch);
_vecdy = cos(_dir) * cos(_pitch);
_vecdz = sin(_pitch);

_vecuz = cos(_pitch);

[[_vecdx, _vecdy, _vecdz], [0, 0, _vecuz]]