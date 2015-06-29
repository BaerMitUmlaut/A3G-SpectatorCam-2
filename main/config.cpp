#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.1;
		requiredAddons[] = {"CBA_Main"};
		author[] = {"BaerMitUmlaut"};
		authorUrl = "https://github.com/BaerMitUmlaut";
		VERSION_CONFIG;
	};
};

class CfgFunctions {
	class A3G_Spectatorcam {
		class Functions {
			file="\b\a3g_spectatorcam\addons\main\functions";
			class calcVectorDirAndUp {};
			class drawMap {};
			class drawUI {};
			class enableBlur {};
			class focusUnit {};
			class handleControls {};
			class handleRespawn {};
			class hidePlayer {};
			class initCam {};
			class initDialogPreferences {};
			class initDialogMap {};
			class initModule {};
			class onMapClick {};
			class onMouseMovingSelectionMode {};
			class onPlayerLBSelect {};
			class onSelection {};
			class onSliderOVDChange {};
			class onSliderVDChange {};
			class unhidePlayer {};
		};
	};
};

#include "CfgVehicles.hpp"
#include "Dialog.hpp"