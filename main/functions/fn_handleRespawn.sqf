private ["_player", "_corpse"];

_player = _this select 0;
_corpse = _this select 1;

if (({side _x == side player} count playableUnits == 1) && A3G_Spectatorcam_set_endMission) then {
	[["LOSER", false], "BIS_fnc_endMission", true, true] call BIS_fnc_MP;
};

if (A3G_Spectatorcam_set_hideRespawned) then {
	[] call A3G_Spectatorcam_fnc_hidePlayer;
};

A3G_Spectatorcam_var_originalGroup = group player;
A3G_Spectatorcam_var_playerSide = side group player;

if (A3G_Spectatorcam_set_allowChatting) then {
	if ("task_force_radio" in activatedAddons) then {[player, true] call TFAR_fnc_forceSpectator};
	if ("acre_main" in activatedAddons) then {[true] call acre_api_fnc_setSpectator};
};

if (isNil "A3G_Spectatorcam_var_spectatorGroup") then {
	A3G_Spectatorcam_var_spectatorGroup = createGroup civilian;
	publicVariable "A3G_Spectatorcam_var_spectatorGroup";
};
[player] joinSilent A3G_Spectatorcam_var_spectatorGroup;

[_corpse] call A3G_Spectatorcam_fnc_initCam;