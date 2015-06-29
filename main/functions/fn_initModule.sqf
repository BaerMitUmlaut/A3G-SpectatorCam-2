#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_logic"];

_logic = _this select 0;

GSET(hideRespawned) = _logic getVariable "hideRespawned";
GSET(markEnemies) = _logic getVariable "markEnemies";
GSET(allowChatting) = _logic getVariable "allowChatting";
GSET(endMission) = _logic getVariable "endMission";

if (!isServer && !hasInterface) exitWith {};
if (isServer) then {
	//In case there is no respawn marker for a faction we're creating one
	{
		if ([(getMarkerPos _x), [0,0,0]] call BIS_fnc_areEqual) then {
			createMarker [_x, [0,0,0]];
		};
	} foreach ["respawn_west", "respawn_east", "respawn_guerrila", "respawn_civilian"];
};
if (hasInterface) then {
	0 spawn {
		sleep 1;
		player addEventHandler ["Respawn", FUNC(handleRespawn)];
	};
};