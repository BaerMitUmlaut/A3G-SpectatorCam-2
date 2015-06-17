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
			file="\A3G_Spectatorcam\functions";
			class calcVectorDirAndUp {};
			class drawUI {};
			class handleControls {};
			class handleRespawn {};
			class hidePlayer {};
			class initCam {};
			class initModule {};
			class unhidePlayer {};
		};
	};
};

#include "CfgVehicles.hpp"