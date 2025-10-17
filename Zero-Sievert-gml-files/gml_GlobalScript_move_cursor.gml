function move_cursor_relative(arg0, arg1)
{
    with (obj_cursor)
    {
        x += (arg0 / 2);
        y += (arg1 / 2);
        cursor_has_moved();
    }
}

function move_cursor_relative_inc_sensitivity(arg0, arg1)
{
    with (obj_cursor)
    {
        x += (arg0 * mouse_sensitivity);
        y += (arg1 * mouse_sensitivity);
        cursor_has_moved();
    }
}

function move_cursor_room(arg0, arg1)
{
    with (obj_cursor)
    {
        x = arg0;
        y = arg1;
        cursor_has_moved();
    }
}

function move_cursor_screen(arg0, arg1)
{
    with (obj_cursor)
    {
        var _pos = gui_space_to_world_space(arg0, arg1);
        x = _pos[0];
        y = _pos[1];
        cursor_has_moved();
    }
}

function move_cursor_room_with_reset(arg0, arg1)
{
    move_cursor_room(arg0, arg1);
    var _win_width = window_get_width();
    var _win_height = window_get_height();
    var _win_middle_h = _win_width / 2;
    var _win_middle_v = _win_height / 2;
    window_mouse_set(_win_middle_h, _win_middle_v);
}
