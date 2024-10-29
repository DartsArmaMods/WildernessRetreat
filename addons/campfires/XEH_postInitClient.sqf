#include "script_component.hpp"

["WRT_marshmallowPack", ["CONTAINER"], LSTRING(grabMarshmallow), [], "", { true }, {
    params ["_unit"];
    [_unit, "WRT_marshmallow", 0, true] call CBA_fnc_addMagazine;
    true; // Keep context menu open
}] call CBA_fnc_addItemContextMenuOption;