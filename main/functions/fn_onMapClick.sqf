#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_map", "_x", "_y", "_worldPos"];

_map = _this select 0;
_x = _this select 2;
_y = _this select 3;

_worldPos = _map ctrlMapScreenToWorld [_x, _y];
_worldPos pushBack ((getPosATL GVAR(cameraObject)) select 2);

GVAR(cameraObject) setPosATL _worldPos;
closeDialog 0;

true