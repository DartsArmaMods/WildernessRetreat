#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Starts roasting a marshmallow.
 *
 * Arguments:
 * 0: Campfire <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_campfire, ace_player] call wrt_campfires_fnc_roastMarshmallow;
 *
 * Public: No
 */

params ["_campfire", "_unit"];
TRACE_2("fnc_roastMarshmallow",_campfire,_unit);

// There isn't a maching animation for pistol / launcher
// So put the weapon away and then play the unarmed version
private _animation = if (currentWeapon _unit == primaryWeapon _unit) then {
    "amovpercmstpslowwrfldnon_amovpsitmstpslowwrfldnon";
} else {
    _unit call ace_weaponselect_fnc_putWeaponAway;
    "amovpsitmstpsnonwnondnon_ground"
};

[_unit, _animation, 1] call ace_common_fnc_doAnimation;

// TODO: Move to a PFH to cook marshmallows over time

// Unit only has empty marshmallow magazines
// fnc_adjustMagazineAmmo will not remove empty magazines
if !(MARSHMALLOW in magazines _unit) then {
    _unit removeMagazine MARSHMALLOW;
};
[_unit, MARSHMALLOW, 1] call ace_common_fnc_adjustMagazineAmmo;