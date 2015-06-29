private ["_unit"];

_unit = _this select 0;

A3G_Spectatorcam_var_cameraDir = direction _unit;
A3G_Spectatorcam_var_cameraPitch = -45;
A3G_Spectatorcam_var_vectorDirAndUp = [A3G_Spectatorcam_var_cameraDir, A3G_Spectatorcam_var_cameraPitch] call A3G_Spectatorcam_fnc_calcVectorDirAndUp;
A3G_Spectatorcam_var_vectorDir = A3G_Spectatorcam_var_vectorDirAndUp select 0;

A3G_Spectatorcam_var_cameraObject setPosATL (_unit modelToWorld [0, -2.5, 3]);