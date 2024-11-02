#include "script_component.hpp"

// List of CBA feature cameras to allow cooking marshmallows in
GVAR(allowedFeatureCameras) = ["", "BNA_KC_screenshotMode"];
[QGVAR(allowedFeatureCameras), GVAR(allowedFeatureCameras)] call CBA_fnc_localEvent; // Event to let mods add feature cameras easily

GVAR(roastingAnimations) = [
    "amovpercmstpslowwrfldnon_amovpsitmstpslowwrfldnon",
    "amovpercmstpsraswpstdnon_amovpercmstpsnonwnondnon",
    "amovpercmstpsraswpstdnon_amovpercmstpsnonwnondnon_end",
    "amovpercmstpsnonwnondnon_amovpsitmstpsnonwnondnon_ground",
    "amovpsitmstpsnonwnondnon_ground",
    "amovpsitmstpslowwrfldnon"
];

["WRT_marshmallowPack", ["CONTAINER"], LSTRING(grabMarshmallow), [], "", { true }, {
    params ["_unit"];
    [_unit, MARSHMALLOW, 1, true] call CBA_fnc_addMagazine;
    false; // Close context menu
}] call CBA_fnc_addItemContextMenuOption;