#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Holsters a unit's weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ace_player call wrt_common_fnc_holsterWeapon;
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];
TRACE_1("fnc_holsterWeapon",_unit);

if !(_unit call ace_common_fnc_isAwake) exitWith {};

_unit action ["SwitchWeapon", _unit, _unit, 299];