private ["_corpse", "_displayMission", "_control", "_layers", "_i"];

#include "dikCodes.h"

_corpse = _this select 0;

//remove any BI camera effects
//source: Splendid Camera (fn_camera.sqf)
[] call bis_fnc_guiEffectTiles;
_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
_control = _displayMission displayctrl 11400;
_control ctrlsetfade 1;
_control ctrlcommit 0;
cutText ["","plain"];
titleText ["","plain"];
_layers = missionnamespace getvariable ["bis_fnc_rscLayer_list",[]];

for "_l" from 1 to (count _layers - 1) step 2 do {
	(_layers select _l) cuttext ["","plain"];
};
clearradio;
enableradio false;

//Create camera object
A3G_Spectatorcam_var_cameraDir = direction _corpse;
A3G_Spectatorcam_var_cameraPitch = -45;
A3G_Spectatorcam_var_cameraObject = "camera" camCreate (_corpse modelToWorld [0, -2.5, 3]);
A3G_Spectatorcam_var_vectorDirAndUp = [A3G_Spectatorcam_var_cameraDir, A3G_Spectatorcam_var_cameraPitch] call A3G_Spectatorcam_fnc_calcVectorDirAndUp;
A3G_Spectatorcam_var_vectorDir = A3G_Spectatorcam_var_vectorDirAndUp select 0;
A3G_Spectatorcam_var_cameraObject setVectorDirAndUp A3G_Spectatorcam_var_vectorDirAndUp;
A3G_Spectatorcam_var_cameraObject cameraEffect ["External", "BACK"];
A3G_Spectatorcam_var_cameraObject camCommit 0;

A3G_Spectatorcam_var_unblockedKeys = [DIK_ESCAPE];
if (A3G_Spectatorcam_set_allowChatting) then {
	A3G_Spectatorcam_var_unblockedKeys append (actionKeys "Chat");
	A3G_Spectatorcam_var_unblockedKeys append (actionKeys "NextChannel");
	A3G_Spectatorcam_var_unblockedKeys append (actionKeys "PrevChannel");
};
A3G_Spectatorcam_var_dialogOpen = false;
A3G_Spectatorcam_var_inSelectionMode = false;

A3G_Spectatorcam_var_onKeyDown = [];
A3G_Spectatorcam_var_onKeyDown set [0xED, {}];
for "_i" from 0 to 0xEC do {
	A3G_Spectatorcam_var_onKeyDown set [_i, {}];
};

A3G_Spectatorcam_var_onKeyDown set [DIK_U, {A3G_Spectatorcam_set_showUI = !A3G_Spectatorcam_set_showUI;}];
A3G_Spectatorcam_var_onKeyDown set [DIK_M, {
	if (!A3G_Spectatorcam_var_dialogOpen) then {
		createDialog "dlgA3GSpectatorcamMap";
	};
}];
A3G_Spectatorcam_var_onKeyDown set [DIK_P, {
	if (!A3G_Spectatorcam_var_dialogOpen) then {
		createDialog "dlgA3GSpectatorcamPreferences";
	};
}];
A3G_Spectatorcam_var_onKeyDown set [DIK_H, {
	if (!A3G_Spectatorcam_var_dialogOpen) then {
		createDialog "dlgA3GSpectatorcamHelp";
	};
}];
A3G_Spectatorcam_var_onKeyDown set [DIK_SPACE, {
	if (!A3G_Spectatorcam_var_dialogOpen) then {
		A3G_Spectatorcam_var_inSelectionMode = true;
		createDialog "dlgA3GSpectatorcamDummy";
	};
}];

(findDisplay 46) displayAddEventHandler ["KeyDown", {
	A3G_Spectatorcam_var_pressedKeys set [(_this select 1), true];
	[] call (A3G_Spectatorcam_var_onKeyDown select (_this select 1));

	if ((_this select 1) in A3G_Spectatorcam_var_unblockedKeys) exitWith {false};
	true
}];

A3G_Spectatorcam_var_onKeyUp = [];
A3G_Spectatorcam_var_onKeyUp set [0xED, {}];
for "_i" from 0 to 0xEC do {
	A3G_Spectatorcam_var_onKeyUp set [_i, {}];
};

A3G_Spectatorcam_var_onKeyUp set [DIK_SPACE, {
	if (A3G_Spectatorcam_var_inSelectionMode) then {
		closeDialog 0;
		A3G_Spectatorcam_var_inSelectionMode = false;
	};
}];

(findDisplay 46) displayAddEventHandler ["KeyUp", {
	A3G_Spectatorcam_var_pressedKeys set [(_this select 1), false];
	[] call (A3G_Spectatorcam_var_onKeyUp select (_this select 1));

	if ((_this select 1) in A3G_Spectatorcam_var_unblockedKeys || A3G_Spectatorcam_var_dialogOpen) then {
		false
	} else {
		true
	};
}];

(findDisplay 46) displayAddEventHandler ["MouseMoving", {
	private ["_deltaX", "_deltaY"];
	if (!A3G_Spectatorcam_var_dialogOpen) then {
		_deltaX = _this select 1;
		_deltaY = _this select 2;
		A3G_Spectatorcam_var_cameraDir = A3G_Spectatorcam_var_cameraDir + _deltaX;
		A3G_Spectatorcam_var_cameraPitch = -89 max (89 min (A3G_Spectatorcam_var_cameraPitch - _deltaY));
		A3G_Spectatorcam_var_vectorDirAndUp = [A3G_Spectatorcam_var_cameraDir, A3G_Spectatorcam_var_cameraPitch] call A3G_Spectatorcam_fnc_calcVectorDirAndUp;
		A3G_Spectatorcam_var_vectorDir = A3G_Spectatorcam_var_vectorDirAndUp select 0;
	};
}];

A3G_Spectatorcam_var_pressedKeys = [];
A3G_Spectatorcam_var_pressedKeys set [0xED, false];
for "_i" from 0 to 0xEC do {
	A3G_Spectatorcam_var_pressedKeys set [_i, false];
};

A3G_Spectatorcam_set_showUI = true;

A3G_Spectatorcam_var_pfhHandleControls = [A3G_Spectatorcam_fnc_handleControls, 0, []] call CBA_fnc_addPerFrameHandler;
A3G_Spectatorcam_var_ehHDrawUI = addMissionEventHandler ["Draw3D", A3G_Spectatorcam_fnc_drawUI];