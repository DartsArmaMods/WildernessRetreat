#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Scan config for music categories marked as playable.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call wrt_radio_fnc_scanConfig;
 *
 * Public: No
 */

private _musicConfig = configFile >> QGVAR(music);
private _playableMusic = toString { getNumber (_x >> "playable") >= 1 } configClasses _musicConfig;

if (_playableMusic isEqualTo []) exitWith {
    INFO("No playable music found, skipping.");
};

private _musicCache = uiNamespace getVariable QGVAR(music);
private _cfgVehicles = configFile >> "CfgVehicles";

{
    private _categoryConfig = _x;
    private _name = getText (_categoryConfig >> "displayName");
    private _soundSources = getArray (_categoryConfig >> "soundSources");
    _soundSources = _soundSources select {
        private _return = isClass (_cfgVehicles >> _x);
        if !(_return) then {
            ERROR_1("Non-existent sound source: '%1' Did you create a CfgVehicles class for it?",configName _x);
        };
        _return;
    };

    if (_soundSources isNotEqualTo []) then {
        _soundSources = _soundSources apply {
            private _musicName = getText (_cfgVehicles >> _x >> "displayName");
            [_x, _musicName];
        };

        _musicCache set [toLowerANSI (configName _x), [_name, _soundSources]];
    };
} forEach _playableMusic;

uiNamespace setVariable [QGVAR(music), compileFinal _musicCache];
nil;