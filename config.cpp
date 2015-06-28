class CfgPatches {
	class A3G_Spectatorcam {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.1;
		requiredAddons[] = {"CBA_Main"};
		version = "2.0";
		versionStr = "2.0";
		versionAr[] = {2,0};
		author[] = {"BaerMitUmlaut"};
		authorUrl = "https://github.com/BaerMitUmlaut";
	};
};

class CfgFunctions {
	class A3G_Spectatorcam {
		class A3G_Spectatorcam {
			file="\A3G-Spectatorcam-2\functions";
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
			class onPlayerLBSelect {};
			class onSliderOVDChange {};
			class onSliderVDChange {};
			class unhidePlayer {};
		};
	};
};

#define A3G_SPECTATORCAM_VERSION 2.0
#define QUOTE(VAR) #VAR

#include "CfgVehicles.hpp"
#include "Dialog.hpp"