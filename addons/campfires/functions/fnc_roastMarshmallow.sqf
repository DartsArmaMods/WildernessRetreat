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

// Sit if not already sitting
if !(toLowerANSI animationState _unit in GVAR(roastingAnimations)) then {
    // There isn't a maching animation for pistol / launcher
    // So put the weapon away and then play the unarmed version
    private _weapon = currentWeapon _unit;
    private _animation = "";
    private _delay = 0;

    switch (true) do {
        case (_weapon != "" and _weapon == primaryWeapon _unit): {
            _animation = "amovpercmstpslowwrfldnon_amovpsitmstpslowwrfldnon";
        };
        case (_weapon != "" and _weapon == secondaryWeapon _unit): {
            _unit call EFUNC(common,holsterWeapon);
            _animation = "amovpsitmstpsnonwnondnon_ground";
            _delay = 2.5; // Need delay to put launcher away, otherwise unit will go prone
        };
        default {
            if (_weapon != "") then {
                _unit call EFUNC(common,holsterWeapon);
            };
            _animation = "amovpsitmstpsnonwnondnon_ground";
        };
    };

    if (_delay == 0) then {
        [_unit, _animation, 1] call ace_common_fnc_doAnimation;
    } else {
        [{ call ace_common_fnc_doAnimation }, [_unit, _animation, 1], _delay] call CBA_fnc_waitAndExecute;
    };
};


if (_unit isEqualTo ace_player) then {
    [_campfire, _unit] call FUNC(roastMarshmallowPFH);
};