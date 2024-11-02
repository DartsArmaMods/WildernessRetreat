#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Returns the ammo count of a given magazine index.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine index <NUMBER|STRING>
 *    - If number, just the numerical id should be passed
 *    - If string, the full id should be passed
 *
 * Return Value:
 * Magazine details, or nil if not found <ARRAY|NONE>
 *   - See https://community.bistudio.com/wiki/magazinesAmmoFull for return
 *
 * Example:
 * [ace_player, 10000003] call wrt_common_fnc_magazineIndexDetails;
 * [ace_player, "10000003/0"] call wrt_common_fnc_magazineIndexDetails;
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_magazineId", -1, [0, ""]]
];
TRACE_2("fnc_magazineIndexAmmo",_unit,_magazineId);

// Remove trailing "/0" and convert to number
if (_magazineId isEqualType "") then {
    _magazineId = parseNumber (_magazineId select [0, count _magazineId - 2]);
};

if (isNull _unit or _magazineId <= 0) exitWith {};

private _foundMagazine = (magazinesAmmoFull [_unit, true]) select {
	(_x select 5) == _magazineId;
} select 0;

_foundMagazine;