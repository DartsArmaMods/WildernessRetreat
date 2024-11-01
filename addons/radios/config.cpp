#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "wrt_main",
            "ace_interact_menu"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgSFX.hpp"
#include "CfgMusic.hpp"
#include "CfgMusicClasses.hpp"
#include "CfgEventHandlers.hpp"
#include "WRT_radios_music.hpp"