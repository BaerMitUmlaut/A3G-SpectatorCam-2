#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"

private ["_viewDistance"];

_viewDistance = _this select 1;
setObjectViewDistance _viewDistance;

true