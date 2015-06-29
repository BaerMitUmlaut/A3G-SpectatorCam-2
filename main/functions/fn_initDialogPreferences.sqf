#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_dialog", "_sliderViewDistance", "_sliderObjectViewDistance"];

_display = _this select 0;
_sliderViewDistance = _display displayCtrl 1;
_sliderObjectViewDistance = _display displayCtrl 2;

_sliderViewDistance sliderSetRange [500, 5000];
_sliderViewDistance sliderSetPosition viewDistance;
_sliderViewDistance sliderSetSpeed [500, 500];

_sliderObjectViewDistance sliderSetRange [500, 5000];
_sliderObjectViewDistance sliderSetPosition getObjectViewDistance;
_sliderObjectViewDistance sliderSetSpeed [500, 500];