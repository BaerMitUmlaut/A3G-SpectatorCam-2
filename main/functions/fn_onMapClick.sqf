private ["_map", "_x", "_y", "_worldPos"];

_map = _this select 0;
_x = _this select 2;
_y = _this select 3;

_worldPos = _map ctrlMapScreenToWorld [_x, _y];
_worldPos pushBack ((getPosATL A3G_Spectatorcam_var_cameraObject) select 2);

A3G_Spectatorcam_var_cameraObject setPosATL _worldPos;
closeDialog 0;

true