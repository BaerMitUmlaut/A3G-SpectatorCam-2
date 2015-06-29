#include "\b\a3g_spectatorcam\addons\main\script_component.hpp"

if (!(isNull GVAR(currentSelection))) then {
	[GVAR(currentSelection)] call FUNC(focusUnit);
	closeDialog 0;
};

true