if (_this select 0) then {
	if (isNil "A3G_Spectatorcam_var_blurHandle") then {
		A3G_Spectatorcam_var_blurHandle = ppEffectCreate ["dynamicBlur", 100];
		A3G_Spectatorcam_var_blurHandle ppEffectAdjust [2];
		A3G_Spectatorcam_var_blurHandle ppEffectEnable true;
		A3G_Spectatorcam_var_blurHandle ppEffectCommit 0;
	} else {
		A3G_Spectatorcam_var_blurHandle ppEffectEnable true;
		A3G_Spectatorcam_var_blurHandle ppEffectCommit 0;
	};
} else {
	if (!(isNil "A3G_Spectatorcam_var_blurHandle")) then {
		A3G_Spectatorcam_var_blurHandle ppEffectEnable false;
		A3G_Spectatorcam_var_blurHandle ppEffectCommit 0;
	};
};