#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
#include "\b\a3g_spectatorcam\addons\main\dikCodes.hpp"
private ["_movementDelta", "_heightATL", "_newPos"];

//Handle camera movement
_movementDelta = [0, 0, 0];

if (GVAR(pressedKeys) select DIK_W) then {
	_movementDelta = _movementDelta vectorAdd GVAR(vectorDir);
};
if (GVAR(pressedKeys) select DIK_S) then {
	_movementDelta = _movementDelta vectorDiff GVAR(vectorDir);
};
if (GVAR(pressedKeys) select DIK_A) then {
	_movementDelta = _movementDelta vectorAdd
		[(GVAR(vectorDir) select 0) * -4.37114e-008 - (GVAR(vectorDir) select 1),
		 (GVAR(vectorDir) select 1) * -4.37114e-008 + (GVAR(vectorDir) select 0),
		 0];
};
if (GVAR(pressedKeys) select DIK_D) then {
	_movementDelta = _movementDelta vectorDiff
		[(GVAR(vectorDir) select 0) * -4.37114e-008 - (GVAR(vectorDir) select 1),
		 (GVAR(vectorDir) select 1) * -4.37114e-008 + (GVAR(vectorDir) select 0),
		 0];
};

_movementDelta set [2, 0];
_movementDelta = vectorNormalized _movementDelta;

if (GVAR(pressedKeys) select DIK_Q) then {
	_movementDelta = _movementDelta vectorAdd [0, 0, 0.5];
};
if (GVAR(pressedKeys) select DIK_Z) then {
	_movementDelta = _movementDelta vectorAdd [0, 0, -0.5];
};

//Adjust speed
if !(GVAR(pressedKeys) select DIK_LSHIFT) then {
	if (GVAR(pressedKeys) select DIK_LALT) then {
		_movementDelta = _movementDelta vectorMultiply 1.4;
	} else {
		_movementDelta = _movementDelta vectorMultiply 4;
	};
} else {
	_movementDelta = _movementDelta vectorMultiply 8;
};

_heightATL = (getPosATL GVAR(cameraObject)) select 2;
_movementDelta = _movementDelta vectorMultiply (20 min (1 max (_heightATL * 0.5)));
_movementDelta = _movementDelta vectorMultiply (time - GVAR(lastMovement));
_newPos = (getPosATL GVAR(cameraObject)) vectorAdd _movementDelta;
_newPos set [2, ((_newPos select 2) max 0.1)];
if (((ATLToASL _newPos) select 2) < 0.1) then {
	_newPos = ATLToASL _newPos;
	_newPos set [2, 0.1];
	_newPos = ASLToATL _newPos;
};
GVAR(cameraObject) setPosATL _newPos;

GVAR(lastMovement) = time;

//Handle camera direction and pitch
GVAR(cameraObject) setVectorDirAndUp GVAR(vectorDir)AndUp;