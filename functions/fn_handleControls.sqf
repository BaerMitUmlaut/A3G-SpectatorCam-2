private ["_movementDelta", "_heightATL", "_newPos"];

#include "dikCodes.h"

//Handle camera movement
_movementDelta = [0, 0, 0];

if (A3G_Spectatorcam_var_pressedKeys select DIK_W) then {
	_movementDelta = _movementDelta vectorAdd A3G_Spectatorcam_var_vectorDir;
};
if (A3G_Spectatorcam_var_pressedKeys select DIK_S) then {
	_movementDelta = _movementDelta vectorDiff A3G_Spectatorcam_var_vectorDir;
};
if (A3G_Spectatorcam_var_pressedKeys select DIK_A) then {
	_movementDelta = _movementDelta vectorAdd
		[(A3G_Spectatorcam_var_vectorDir select 0) * -4.37114e-008 - (A3G_Spectatorcam_var_vectorDir select 1),
		 (A3G_Spectatorcam_var_vectorDir select 1) * -4.37114e-008 + (A3G_Spectatorcam_var_vectorDir select 0),
		 0];
};
if (A3G_Spectatorcam_var_pressedKeys select DIK_D) then {
	_movementDelta = _movementDelta vectorDiff
		[(A3G_Spectatorcam_var_vectorDir select 0) * -4.37114e-008 - (A3G_Spectatorcam_var_vectorDir select 1),
		 (A3G_Spectatorcam_var_vectorDir select 1) * -4.37114e-008 + (A3G_Spectatorcam_var_vectorDir select 0),
		 0];
};

_movementDelta set [2, 0];

if (A3G_Spectatorcam_var_pressedKeys select DIK_Q) then {
	_movementDelta = _movementDelta vectorAdd [0, 0, 0.5];
};
if (A3G_Spectatorcam_var_pressedKeys select DIK_Z) then {
	_movementDelta = _movementDelta vectorAdd [0, 0, -0.5];
};

//Adjust speed
if !(A3G_Spectatorcam_var_pressedKeys select DIK_LSHIFT) then {
	if (A3G_Spectatorcam_var_pressedKeys select DIK_LALT) then {
		_movementDelta = _movementDelta vectorMultiply 1.4;
	} else {
		_movementDelta = _movementDelta vectorMultiply 4;
	};
} else {
	_movementDelta = _movementDelta vectorMultiply 8;
};

_heightATL = (getPosATL A3G_Spectatorcam_var_cameraObject) select 2;
_movementDelta = _movementDelta vectorMultiply (20 min (1 max (_heightATL * 0.5)));
_movementDelta = _movementDelta vectorMultiply (time - A3G_Spectatorcam_var_lastMovement);
_newPos = (getPosATL A3G_Spectatorcam_var_cameraObject) vectorAdd _movementDelta;
_newPos set [2, ((_newPos select 2) max 0.1)];
if (((ATLToASL _newPos) select 2) < 0.1) then {
	_newPos = ATLToASL _newPos;
	_newPos set [2, 0.1];
	_newPos = ASLToATL _newPos;
};
A3G_Spectatorcam_var_cameraObject setPosATL _newPos;

A3G_Spectatorcam_var_lastMovement = time;

//Handle camera direction and pitch
A3G_Spectatorcam_var_cameraObject setVectorDirAndUp A3G_Spectatorcam_var_vectorDirAndUp;