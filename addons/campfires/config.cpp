#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "wrt_common",
            "ace_weaponselect"
        };
        units[] = {
            "WRT_marshmallowPack_GH"
        };
        weapons[] = {
            "WRT_marshmallowPack"
        };
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"