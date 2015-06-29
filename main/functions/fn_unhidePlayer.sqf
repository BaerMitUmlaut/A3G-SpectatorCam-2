player setPosASL A3G_Spectatorcam_var_respawnPos;
player enableSimulation true;
[[player, {_this hideObject false}], "BIS_fnc_spawn", true, true] call BIS_fnc_MP;