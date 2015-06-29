#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_player", "_corpse"];

_player = _this select 0;
_corpse = _this select 1;

if (({side _x == side player} count playableUnits == 1) && GSET(endMission)) then {
	[["LOSER", false], "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
};

if (GSET(hideRespawned)) then {
	[] call FUNC(hidePlayer);
};

GVAR(originalGroup) = group player;
GVAR(playerSide) = side group player;

if (GSET(allowChatting)) then {
	if ("task_force_radio" in activatedAddons) then {[player, true] call TFAR_fnc_forceSpectator};
	if ("acre_main" in activatedAddons) then {[true] call acre_api_fnc_setSpectator};
};

if (isNil QGVAR(spectatorGroup)) then {
	GVAR(spectatorGroup) = createGroup civilian;
	publicVariable QGVAR(spectatorGroup);
};
[player] joinSilent GVAR(spectatorGroup);

[_corpse] call FUNC(initCam);