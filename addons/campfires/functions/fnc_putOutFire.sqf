#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Puts out a campfire.
 *
 * Arguments:
 * 0: Campfire <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_campfire, ace_player] call wrt_campfires_fnc_putOutFire;
 *
 * Public: No
 */

params ["_campfire", "_unit"];
TRACE_2("fnc_putOutFire",_campfire,_unit);

[_unit, "PutDown"] call ace_common_fnc_doGesture;
_target inflame false;
nil;