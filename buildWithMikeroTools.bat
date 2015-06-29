@echo off
echo Information
echo -----------
echo This build requires a correctly setup P: drive (with the source files being at "P:\b\a3g_spectatorcam\addons\main"). If something is wrong with your setup, this build will fail.
echo.
pause
set pathBuild="P:\b\a3g_spectatorcam\addons\build\@a3g_spectatorcam"
set pathSource="P:\b\a3g_spectatorcam\addons\main"
if not exist %pathBuild% (mkdir %pathBuild%)
pboProject -P %pathSource% +Engine=Arma3 -S +Noisy +X +Clean +Mod=%pathBuild%