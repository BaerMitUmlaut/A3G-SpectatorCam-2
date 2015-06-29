#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"
private ["_unit"];

_unit = _this select 0;

GVAR(cameraDir) = direction _unit;
GVAR(cameraPitch) = -45;
GVAR(vectorDirAndUp) = [GVAR(cameraDir), GVAR(cameraPitch)] call FUNC(calcVectorDirAndUp);
GVAR(vectorDir) = GVAR(vectorDirAndUp) select 0;

GVAR(cameraObject) setPosATL (_unit modelToWorld [0, -2.5, 3]);