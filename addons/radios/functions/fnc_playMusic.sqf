#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Plays a song from a radio using CfgVehicles classes.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: CfgVehicles class <STRING>
 *
 * Return Value:
 * True if music was played, otherwise false <BOOL>
 *
 * Example:
 * [] call wrt_radios_fnc_playMusic;
 *
 * Public: Yes
 */

params [
    ["_object", objNull, [objNull]],
    ["_soundClass", "", [""]]
];
TRACE_3("fnc_playMusic",_object,_soundClass,_overwriteTrack);

if (isNull _object) exitWith { false };
if (!isClass (configFile >> "CfgVehicles" >> _soundClass)) exitWith {
    ERROR_1("Cannot create non-existent sound: %1",_soundClass);
    false;
};

// Delete old sound source if it exists
_object call FUNC(stopMusic);

_soundSource = createSoundSource [_soundClass, _object, [], 0];
_object setVariable [QGVAR(soundSource), _soundSource, true];

true;