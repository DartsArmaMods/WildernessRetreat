#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * CBA per frame handler for marshmallow roasting.
 *
 * Arguments:
 * 0: Campfire <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_campfire, ace_player] call wrt_campfires_fnc_roastMarshmallowPFH;
 *
 * Public: No
 */

#define UPDATE_RATE 1
#define AMMO_ADD 1

params ["_campfire", "_unit"];
TRACE_2("fnc_roastMarshmallowPFH",_campfire,_unit);

if (_unit getVariable [QGVAR(roastMarshmallowPFH_id), -1] >= 0) exitWith {
    TRACE_1("Already added PFH to unit",_unit);
};

_unit addEventHandler ["AnimStateChanged", {
    params ["_unit", "_anim"];
    if !(_anim in GVAR(roastingAnimations)) then {
        _unit setVariable [QGVAR(isRoastingMarshmallow), false];
        _unit removeEventHandler [_thisEvent, _thisEventHandler];
    };
}];

_unit setVariable [QGVAR(isRoastingMarshmallow), true];

private _function = {
    params ["", "_unit"];

    private _magazinesBefore = [_unit, MARSHMALLOW] call CBA_fnc_getMagazineIndex;
    [_unit, MARSHMALLOW, AMMO_ADD] call ace_common_fnc_adjustMagazineAmmo;
    private _magazinesAfter = [_unit, MARSHMALLOW] call CBA_fnc_getMagazineIndex;

    private _magazineId = (_magazinesAfter - _magazinesBefore);
    if (_magazineId isEqualTo []) then {
        // Unit no longer has a marshmallow
        _unit setVariable [QGVAR(isRoastingMarshmallow), false];
    };

    _magazineId = _magazineId select 0;
    _magazineId = parseNumber (_magazineId select [0, count _magazineId - 2]);
    _unit setVariable [QGVAR(currentMarshmallowId), _magazineId];

    [_unit, _magazineId] call EFUNC(common,magazineIndexDetails) params ["", "_ammoCount"];

    if (_ammoCount == MARSHMALLOW_MAX_AMMO) then {
        LLSTRING(marshmallowBurntUp) call ace_common_fnc_displayTextStructured;
        [_unit, MARSHMALLOW, MARSHMALLOW_MAX_AMMO] call CBA_fnc_removeMagazine;
        _unit setVariable [QGVAR(isRoastingMarshmallow), false];
    };
};

private _condition = {
    params ["_campfire", "_unit"];
    inflamed _campfire and
    {_unit getVariable [QGVAR(isRoastingMarshmallow), false]} and
    {([] call CBA_fnc_getActiveFeatureCamera) in GVAR(allowedFeatureCameras)};
};

private _exitCode = {
    params ["", "_unit"];
    _unit setVariable [QGVAR(roastMarshmallowPFH_id), nil];
};

private _pfhId = [_function, _condition, _exitCode, UPDATE_RATE, [_campfire, _unit]] call EFUNC(common,tempPFH);
_unit setVariable [QGVAR(roastMarshmallowPFH_id), _pfhId];

nil;