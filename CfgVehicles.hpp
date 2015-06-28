class CfgFactionClasses {
	class NO_CATEGORY;
	class A3G_Spectatorcam: NO_CATEGORY {
		displayName = "A3G Spectatorcam";
	};
};

class CfgVehicles {
	class Module_F;

	class A3G_moduleSpectatorcamSettings: Module_F {
		scope = 2;
		displayName = "Spectatorcam Settings";
		icon = "\A3G-Spectatorcam-2\UI\iconModule.paa";
		category = "A3G_Spectatorcam";
		function = "A3G_Spectatorcam_fnc_initModule";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 1;
		author = "BaerMitUmlaut";

		class Arguments {
			class hideRespawned {
				displayName = "Hide respawned units";
				description = "Hides units that respawned and are in spectator mode";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class markEnemies {
				displayName = "Mark hostile units";
				description = "Shows a marker above hostile units in spectator mode";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class endMission {
				displayName = "Automatically end mission";
				description = "Ends mission after last unit of one side dies";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class allowChatting {
				displayName = "Allow spectator chat";
				description = "Allows dead players to talk to each other in spectator mode";
				typeName = "BOOL";
				defaultValue = 1;
			};
		};

		class ModuleDescription {
			description = "This module enables the spectator cam for all players on death.";
			sync[] = {};
		};
	};
};