#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit can roast a marshmallow.
 *
 * Arguments:
 * 0: Campfire <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if unit can roast a marshmallow, otherwise false <BOOL>
 *
 * Example:
 * [_campfire, ace_player] call wrt_campfires_fnc_canRoastMarshmallow;
 *
 * Public: No
 */

params ["_campfire", "_unit"];
TRACE_2("fnc_canRoastMarshmallow",_campfire,_unit);

inflamed _campfire and
{MARSHMALLOW in magazines [_unit, true]} and {
    private _animation = animationState _unit;
    !(_animation in ["amovpsitmstpslowwrfldnon", "amovpsitmstpsnonwnondnon_ground"]);
};