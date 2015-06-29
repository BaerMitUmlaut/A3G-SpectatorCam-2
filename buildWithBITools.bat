@echo off
echo Information
echo -----------
echo This build will not contain a binarized config, but will work without a P: drive setup. It is recommended to use a P: drive setup if possible.
echo.
pause
set pathCurrent=%~dp0
set pathSource="%pathCurrent%main"
set pathBuild="%pathCurrent%build\@a3g_spectatorcam\Addons"
if not exist %pathBuild% (mkdir %pathBuild%)
"C:\Program Files (x86)\Steam\SteamApps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe" %pathSource% %pathBuild% -clear -packonly -prefix="b\a3g_spectatorcam\addons\main" -include="D:\Github\Arma\include.txt"
pause