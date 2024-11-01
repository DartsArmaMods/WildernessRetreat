#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Creates ACE actions for playing music tracks.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Player (unused) <OBJECT>
 *
 * Return Value:
 * An array of ACE Actions <ARRAY>
 *
 * Example:
 * _radio call wrt_radio_fnc_playMusic_insertChildren;
 *
 * Public: No
 */

params ["_target"];
TRACE_1("fnc_playMusic_insertChildren",_target);

private _actions = [];

{
    private _categoryClass = _x;
    _y params ["_categoryName", "_soundClasses"];

    private _childActions = [];

    private _categoryAction = [
        format [QGVAR(playMusicCategory_%1), _categoryClass],
        _categoryName, "", {}, {true}, {}
    ] call ace_interact_menu_fnc_createAction;

    {
        _x params ["_soundClass", "_soundName"];
        private _soundAction = [
            format [QGVAR(playMusic_%1), _soundClass],
            format [LLSTRING(playMusicFormat), _soundName],
            "", {
                params ["_target", "", "_soundClass"];
                [_target, _soundClass] call FUNC(playMusic);
            }, {true}, {}, _soundClass
        ] call ace_interact_menu_fnc_createAction;

        _childActions pushBack [_soundAction, [], _target];
    } forEach _soundClasses;

    _actions pushBack [_categoryAction, _childActions, _target];
} forEach GVAR(music);

_actions;