#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#define GSET(var1) DOUBLES(DOUBLES(ADDON,set),var1)

#define DLG(var1) dlgA3GSpectatorcam##var1
#define CTRL(var1) ctrlA3GSpectatorcam##var1
#define ROW(NUMBER) y = safezoneY + 0.1 * (4/3) + 0.12 + NUMBER * 0.07;