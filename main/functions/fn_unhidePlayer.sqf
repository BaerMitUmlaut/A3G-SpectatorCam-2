#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"

player setPosASL GVAR(respawnPos);
player enableSimulation true;
[[player, {_this hideObject false}], "BIS_fnc_spawn", true, true] call BIS_fnc_MP;