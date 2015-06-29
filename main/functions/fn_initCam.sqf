#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
#include "\b\a3g_spectatorcam\addons\main\dikCodes.hpp"
private ["_corpse", "_displayMission", "_control", "_layers", "_i"];

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
GVAR(cameraDir) = direction _corpse;
GVAR(cameraPitch) = -45;
GVAR(cameraObject) = "camera" camCreate (_corpse modelToWorld [0, -2.5, 3]);
GVAR(vectorDirAndUp) = [GVAR(cameraDir), GVAR(cameraPitch)] call FUNC(calcVectorDirAndUp);
GVAR(vectorDir) = GVAR(vectorDirAndUp) select 0;
GVAR(cameraObject) setVectorDirAndUp GVAR(vectorDirAndUp);
GVAR(cameraObject) cameraEffect ["External", "BACK"];
GVAR(cameraObject) camCommit 0;

GVAR(unblockedKeys) = [DIK_ESCAPE];
if (GSET(allowChatting)) then {
	GVAR(unblockedKeys) append (actionKeys "Chat");
	GVAR(unblockedKeys) append (actionKeys "NextChannel");
	GVAR(unblockedKeys) append (actionKeys "PrevChannel");
};
GVAR(dialogOpen) = false;
GVAR(inSelectionMode) = false;

GVAR(onKeyDown) = [];
GVAR(onKeyDown) set [0xED, {}];
for "_i" from 0 to 0xEC do {
	GVAR(onKeyDown) set [_i, {}];
};

GVAR(onKeyDown) set [DIK_U, {GSET(showUI) = !GSET(showUI);}];
GVAR(onKeyDown) set [DIK_M, {
	if (!GVAR(dialogOpen)) then {
		createDialog QDLG(Map);
	};
}];
GVAR(onKeyDown) set [DIK_P, {
	if (!GVAR(dialogOpen)) then {
		createDialog QDLG(Preferences);
	};
}];
GVAR(onKeyDown) set [DIK_H, {
	if (!GVAR(dialogOpen)) then {
		createDialog QDLG(Help);
	};
}];
GVAR(onKeyDown) set [DIK_SPACE, {
	if (!GVAR(inSelectionMode)) then {
		//once the dummy dialog closes, Arma will send a new onKeyDown event for space
		//by only changing inSelectionMode on the next keyUp, we can circumvent accidentally opening the dialog again
		if (!GVAR(dialogOpen)) then {
			GVAR(inSelectionMode) = true;
			createDialog QDLG(Dummy);
		};
	};
}];
GVAR(onKeyDown) set [DIK_ESCAPE, {
	0 spawn {
		waitUntil {!(isNull (findDisplay 49))};
		(findDisplay 49) displayCtrl 1010 ctrlEnable false;
	};
}];

(findDisplay 46) displayAddEventHandler ["KeyDown", {
	GVAR(pressedKeys) set [(_this select 1), true];
	[] call (GVAR(onKeyDown) select (_this select 1));

	if ((_this select 1) in GVAR(unblockedKeys)) exitWith {false};
	true
}];

GVAR(onKeyUp) = [];
GVAR(onKeyUp) set [0xED, {}];
for "_i" from 0 to 0xEC do {
	GVAR(onKeyUp) set [_i, {}];
};

GVAR(onKeyUp) set [DIK_SPACE, {
	if (GVAR(inSelectionMode)) then {
		GVAR(inSelectionMode) = false;
	};
}];

(findDisplay 46) displayAddEventHandler ["KeyUp", {
	GVAR(pressedKeys) set [(_this select 1), false];
	[] call (GVAR(onKeyUp) select (_this select 1));

	if ((_this select 1) in GVAR(unblockedKeys) || GVAR(dialogOpen)) then {
		false
	} else {
		true
	};
}];

(findDisplay 46) displayAddEventHandler ["MouseMoving", {
	private ["_deltaX", "_deltaY"];
	if (!GVAR(dialogOpen)) then {
		_deltaX = _this select 1;
		_deltaY = _this select 2;
		GVAR(cameraDir) = GVAR(cameraDir) + _deltaX;
		GVAR(cameraPitch) = -89 max (89 min (GVAR(cameraPitch) - _deltaY));
		GVAR(vectorDirAndUp) = [GVAR(cameraDir), GVAR(cameraPitch)] call FUNC(calcVectorDirAndUp);
		GVAR(vectorDir) = GVAR(vectorDirAndUp) select 0;
	};
}];

GVAR(pressedKeys) = [];
GVAR(pressedKeys) set [0xED, false];
for "_i" from 0 to 0xEC do {
	GVAR(pressedKeys) set [_i, false];
};

GSET(showUI) = true;

GVAR(pfhHandleControls) = [FUNC(handleControls), 0, []] call CBA_fnc_addPerFrameHandler;
GVAR(ehHDrawUI) = addMissionEventHandler ["Draw3D", FUNC(drawUI)];