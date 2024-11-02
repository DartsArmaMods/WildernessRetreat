#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Lights a campfire
 *
 * Arguments:
 * 0: Campfire <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * True if unit can roast a marshmallow, otherwise false <BOOL>
 *
 * Example:
 * [_campfire, ace_player] call wrt_campfires_fnc_lightFire;
 *
 * Public: No
 */

params ["_campfire", "_unit"];
TRACE_2("fnc_lightFire",_campfire,_unit);

[_unit, "PutDown"] call ace_common_fnc_doGesture;
_target inflame true;
nil;