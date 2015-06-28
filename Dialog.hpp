#define ROW(NUMBER) y = safezoneY + 0.1 * (4/3) + 0.12 + NUMBER * 0.07;

class dlgA3GSpectatorcamBase {
	idd = -1;
	onLoad = "[true] call A3G_Spectatorcam_fnc_enableBlur; A3G_Spectatorcam_var_dialogOpen = true;";
	onUnload = "[false] call A3G_Spectatorcam_fnc_enableBlur; A3G_Spectatorcam_var_dialogOpen = false;";
	movingEnable = false;
	enableSimulation = 1;
	
	controlsBackground[] = {background};
	controls[] = {};

	class background {
		idc = -1;
		type = 0;
		x = safezoneX + safezoneW - (safezoneW / 4);
		y = safezoneY;
		w = safezoneW / 4;
		h = safezoneH;
		style = 0;
		font = "PuristaMedium";
		SizeEx = 0;
		colorText[] = {0, 0, 0, 0};
		colorBackground[] = {0, 0, 0, 0.75};
		text = "";
	};
};

class dlgA3GSpectatorcamDummy {
	onLoad = "A3G_Spectatorcam_var_dialogOpen = true;";
	onUnload = "A3G_Spectatorcam_var_dialogOpen = false;";
	idd = -1;
	movingEnable = false;
	enableSimulation = 1;
	
	controlsBackground[] = {};
	controls[] = {};
};

class ctrlA3GSpectatorcamText {
	idc = -1;
	type = 0;
	style = 0x210;
	lineSpacing = 1;
	font = "PuristaMedium";
	SizeEx = 0.05;
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0, 0, 0, 0};
	w = (safezoneW / 4) - 0.1;
	h = 0.3;
	x = safezoneX + safezoneW - (safezoneW / 4) + 0.05;
};

class ctrlA3GSpectatorcamStructuredText {
	idc = -1;
	type = 13;
	style = 0x210;
	lineSpacing = 1;
	font = "PuristaMedium";
	SizeEx = 0.05;
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0, 0, 0, 0};
	w = (safezoneW / 4) - 0.1;
	h = 0.3;
	x = safezoneX + safezoneW - (safezoneW / 4) + 0.05;

	size = 0.05;
	ShowImage = false;
	class Attributes {
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		valgin = "top";
		shadow = 0;
		shadowColor = "#000000";
		size = 1;
	};
};

class ctrlA3GSpectatorcamHeader {
	idc = -1;
	type = 0;
	style = 0;
	font = "PuristaMedium";
	SizeEx = 0.08;
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0, 0, 0, 0};
	w = (safezoneW / 4) - 0.1;
	h = 0.1;
	x = safezoneX + safezoneW - (safezoneW / 4) + 0.05;
	y = safezoneY + 0.1 * (4/3);
};

class ctrlA3GSpectatorcamFooter : ctrlA3GSpectatorcamText {
	text = QUOTE(A3G Spectatorcam A3G_SPECTATORCAM_VERSION);
	style = 2;
	SizeEx = 0.04;
	y = safezoneY + safezoneH - 0.1 * (4/3) - 0.04;
};

class ctrlA3GSpectatorcamSlider {
	idc = -1;
	type = 43;
	style = 1024;
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
	color[] = {1,1,1,0.7};
	colorActive[] = {1,1,1,0.7};
	colorDisabled[] = {0,0,0,0.7};
	w = (safezoneW / 4) - 0.1;
	h = 0.05;
	x = safezoneX + safezoneW - (safezoneW / 4) + 0.05;
};

class ctrlA3GSpectatorcamComboBox {
	idc = -1;
	text = "";
	access = 0;
	type = 4;
	style = 0x200;
	blinkingPeriod = 0;

	w = (safezoneW / 4) - 0.1;
	h = 0.05;
	x = safezoneX + safezoneW - (safezoneW / 4) + 0.05;

	colorBackground[] = {0,0,0,0.7};
	colorSelectBackground[] = {1,1,1,0.7};

	sizeEx = 0.05;
	font = "PuristaMedium";
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.5};
	colorSelect[] = {0,0,0,1};

	pictureColor[] = {1,1,1,1};
	pictureColorSelect[] = {0,0,0,1};
	pictureColorDisabled[] = {1,1,1,0.5};

	tooltip = "";
	tooltipColorShade[] = {0,0,0,0};
	tooltipColorText[] = {0,0,0,0};
	tooltipColorBox[] = {0,0,0,0};

	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";

	wholeHeight = safezoneH / 2;
	maxHistoryDelay = 1;

	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};

	class ComboScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

		color[] = {1,1,1,1};
	};
};

class ctrlA3GSpectatorcamListBox {
	access = 0;
	idc = -1;
	type = 5;
	style = 0x200;
	blinkingPeriod = 0;

	w = (safezoneW / 4) - 0.1;
	x = safezoneX + safezoneW - (safezoneW / 4) + 0.05;

	colorBackground[] = {0,0,0,0.7};
	colorSelectBackground[] = {1,1,1,0.7};
	colorSelectBackground2[] = {1,1,1,0.7};

	sizeEx = 0.05;
	font = "PuristaMedium";
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.5};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0};

	pictureColor[] = {1,1,1,1};
	pictureColorSelect[] = {1,1,1,1};
	pictureColorDisabled[] = {1,1,1,0.5};

	tooltip = "";
	tooltipColorShade[] = {0,0,0,0};
	tooltipColorText[] = {0,0,0,0};
	tooltipColorBox[] = {0,0,0,0};

	period = 1;

	rowHeight = 0.07;
	itemSpacing = 0;
	maxHistoryDelay = 1;
	canDrag = 0;

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};

	class ListScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

		color[] = {1,1,1,1};
	};
};

class RscMapControl;
class ctrlA3GSpectatorcamMap : RscMapControl {
	type = 101;
	idc = -1;
	style = 0;
	colorOutside[] = {1,1,1,1};
	class Legend {
		x = safezoneW;
		y = safezoneH;
	};
};

class ctrlA3GSpectatorcamBGMap {
	idc = -1;
	type = 0;
	style = 0;
	font = "PuristaMedium";
	SizeEx = 0;
	colorText[] = {0, 0, 0, 0};
	colorBackground[] = {1, 1, 1, 1};
	text = "";
};

class dlgA3GSpectatorcamMap : dlgA3GSpectatorcamBase {
	onLoad = "[true] call A3G_Spectatorcam_fnc_enableBlur; _this call A3G_Spectatorcam_fnc_initDialogMap; A3G_Spectatorcam_var_dialogOpen = true;";
	onUnload = "[false] call A3G_Spectatorcam_fnc_enableBlur; A3G_Spectatorcam_var_dialogOpen = false;";


	controlsBackground[] = {
		background,
		ctrlHeaderMap,
		ctrlTextMapDesc,
		ctrlBGMap
	};
	controls[] = {
		ctrlListBoxMapPlayers,
		ctrlMap
	};

	class ctrlHeaderMap : ctrlA3GSpectatorcamHeader {
		text = "Map";
	};

	class ctrlTextMapDesc : ctrlA3GSpectatorcamText {
		text = "Click on the map to teleport around or select a player to spectate below.";
		ROW(0)
	};

	class ctrlListBoxMapPlayers : ctrlA3GSpectatorcamListBox {
		ROW(3)
		h = safezoneH / 2;
		idc = 1;
		onLBSelChanged = "_this call A3G_Spectatorcam_fnc_onPlayerLBSelect";
	};

	class ctrlMap : ctrlA3GSpectatorcamMap {
		h = safezoneH - 0.2 * (4/3);
		w = safezoneW * 0.75 - 0.2;
		x = safezoneX + 0.1;
		y = safezoneY + 0.1 * (4/3);
		idc = 2;
		onDraw = "_this call A3G_Spectatorcam_fnc_drawMap";
		onMouseButtonClick = "_this call A3G_Spectatorcam_fnc_onMapClick";
	};

	class ctrlBGMap : ctrlA3GSpectatorcamBGMap {
		h = safezoneH - 0.1 * (4/3);
		w = safezoneW * 0.75 - 0.1;
		x = safezoneX + 0.05;
		y = safezoneY + 0.05 * (4/3);
	};
};

class dlgA3GSpectatorcamPreferences : dlgA3GSpectatorcamBase {
	onLoad = "[true] call A3G_Spectatorcam_fnc_enableBlur; _this call A3G_Spectatorcam_fnc_initDialogPreferences; A3G_Spectatorcam_var_dialogOpen = true;";
	onUnload = "[false] call A3G_Spectatorcam_fnc_enableBlur; A3G_Spectatorcam_var_dialogOpen = false;";

	controlsBackground[] = {
		background,
		ctrlHeaderPreferences,
		ctrlFooterPreferences,
		ctrlTextPreferencesView,
		ctrlTextPreferencesObject
	};
	controls[] = {
		ctrlSliderPreferencesView,
		ctrlSliderPreferencesObject
	};

	class ctrlHeaderPreferences : ctrlA3GSpectatorcamHeader {
		text = "Preferences";
	};

	class ctrlFooterPreferences : ctrlA3GSpectatorcamFooter {};

	class ctrlTextPreferencesView : ctrlA3GSpectatorcamText {
		text = "Viewdistance:";
		ROW(0)
	};

	class ctrlSliderPreferencesView : ctrlA3GSpectatorcamSlider {
		idc = 1;
		ROW(1)
		onSliderPosChanged = "_this call A3G_Spectatorcam_fnc_onSliderVDChange";
	};

	class ctrlTextPreferencesObject : ctrlA3GSpectatorcamText {
		text = "Object viewdistance:";
		ROW(3)
	};

	class ctrlSliderPreferencesObject : ctrlA3GSpectatorcamSlider {
		idc = 2;
		ROW(4)
		onSliderPosChanged = "_this call A3G_Spectatorcam_fnc_onSliderOVDChange";
	};

	class ctrlTextPreferencesFocus : ctrlA3GSpectatorcamText {
		text = "Focus:";
		ROW(5)
	};

	class ctrlSliderPreferencesFocus : ctrlA3GSpectatorcamSlider {
		idc = 3;
		ROW(6)
	};

	class ctrlTextPreferencesPost : ctrlA3GSpectatorcamText {
		text = "Post process effect:";
		ROW(7)
	};

	class ctrlComboBoxPreferencesPost : ctrlA3GSpectatorcamComboBox {
		idc = 4;
		ROW(8)
	};
};

class dlgA3GSpectatorcamHelp : dlgA3GSpectatorcamBase {

	controlsBackground[] = {
		background,
		ctrlHeaderHelp,
		ctrlFooterHelp,
		ctrlTextHelpKeybindsMove,
		ctrlTextHelpKeybindsHeight,
		ctrlTextHelpKeybindsFast,
		ctrlTextHelpKeybindsSlow,
		ctrlTextHelpKeybindsSelect,
		ctrlTextHelpKeybindsVision,
		ctrlTextHelpKeybindsPrevNext,
		ctrlTextHelpKeybindsPreferences,
		ctrlTextHelpKeybindsUI
	};

	class ctrlHeaderHelp : ctrlA3GSpectatorcamHeader {
		text = "Help";
	};

	class ctrlFooterHelp : ctrlA3GSpectatorcamFooter {};

	class ctrlTextHelpKeybindsMove : ctrlA3GSpectatorcamStructuredText {
		text = "Move camera<t align='right'>WASD</t>";
		ROW(0)
	};

	class ctrlTextHelpKeybindsHeight : ctrlA3GSpectatorcamStructuredText {
		text = "Raise/Lower camera<t align='right'>Q/Z</t>";
		ROW(1)
	};

	class ctrlTextHelpKeybindsFast : ctrlA3GSpectatorcamStructuredText {
		text = "Faster movement<t align='right'>Shift</t>";
		ROW(2)
	};

	class ctrlTextHelpKeybindsSlow : ctrlA3GSpectatorcamStructuredText {
		text = "Slower movement<t align='right'>Alt</t>";
		ROW(3)
	};

	class ctrlTextHelpKeybindsSelect : ctrlA3GSpectatorcamStructuredText {
		text = "Selection mode<t align='right'>Space</t>";
		ROW(4)
	};

	class ctrlTextHelpKeybindsVision : ctrlA3GSpectatorcamStructuredText {
		text = "Normal/night/thermal vision<t align='right'>N</t>";
		ROW(5)
	};

	class ctrlTextHelpKeybindsPrevNext : ctrlA3GSpectatorcamStructuredText {
		text = "Previous/next player<t align='right'>Left/Right</t>";
		ROW(6)
	};

	class ctrlTextHelpKeybindsPreferences : ctrlA3GSpectatorcamStructuredText {
		text = "Preferences<t align='right'>P</t>";
		ROW(7)
	};

	class ctrlTextHelpKeybindsUI : ctrlA3GSpectatorcamStructuredText {
		text = "Show/Hide HUD<t align='right'>U</t>";
		ROW(8)
	};

	class ctrlTextHelpKeybindsSelectDesc : ctrlA3GSpectatorcamStructuredText {
		text = "To select a unit to spectate, hold Space and click on it.";
		ROW(10)
	};
};