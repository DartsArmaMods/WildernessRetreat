#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Stops an object from playing music.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * True if music was stopped, otherwise false
 *
 * Example:
 * _radio call wrt_radio_fnc_stopMusic;
 *
 * Public: Yes
 */

params [
    ["_object", objNull, [objNull]]
];
TRACE_1("fnc_stopMusic",_object);

if (isNull _object) exitWith { false };

private _soundSource = _object getVariable [QGVAR(soundSource), objNull];

private _return = if (isNull _soundSource) then { false } else {
    deleteVehicle _soundSource;
    true;
};

_return;