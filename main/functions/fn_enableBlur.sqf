#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"

if (_this select 0) then {
	if (isNil QGVAR(blurHandle)) then {
		GVAR(blurHandle) = ppEffectCreate ["dynamicBlur", 100];
		GVAR(blurHandle) ppEffectAdjust [2];
		GVAR(blurHandle) ppEffectEnable true;
		GVAR(blurHandle) ppEffectCommit 0;
	} else {
		GVAR(blurHandle) ppEffectEnable true;
		GVAR(blurHandle) ppEffectCommit 0;
	};
} else {
	if (!(isNil QGVAR(blurHandle))) then {
		GVAR(blurHandle) ppEffectEnable false;
		GVAR(blurHandle) ppEffectCommit 0;
	};
};