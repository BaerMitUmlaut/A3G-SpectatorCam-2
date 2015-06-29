private ["_logic"];

_logic = _this select 0;

A3G_Spectatorcam_set_hideRespawned = _logic getVariable "hideRespawned";
A3G_Spectatorcam_set_markEnemies = _logic getVariable "markEnemies";
A3G_Spectatorcam_set_allowChatting = _logic getVariable "allowChatting";
A3G_Spectatorcam_set_endMission = _logic getVariable "endMission";

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
		player addEventHandler ["Respawn", A3G_Spectatorcam_fnc_handleRespawn];
	};
};