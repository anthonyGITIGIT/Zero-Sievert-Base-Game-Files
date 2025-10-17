var _ui_this_frame = __uiGlobal().__defaultOnion.HasInputReceiver();

if (ui_last_frame == false && _ui_this_frame == true)
{
    var _pos = world_space_to_window_space(x, y);
    window_mouse_set(_pos[0], _pos[1]);
}

ui_last_frame = _ui_this_frame;
