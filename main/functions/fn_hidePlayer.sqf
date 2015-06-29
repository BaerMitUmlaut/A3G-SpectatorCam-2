#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"

GVAR(respawnPos) = getPosASL player;
player setPosASL [-100, -100, 100];
player enableSimulation false;
[[player, {_this hideObject true}], "BIS_fnc_spawn", true, true] call BIS_fnc_MP;