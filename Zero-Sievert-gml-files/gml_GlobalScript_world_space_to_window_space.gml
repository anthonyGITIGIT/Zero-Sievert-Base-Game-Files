function world_space_to_window_space(arg0, arg1)
{
    var _app_pos = application_get_position();
    var _x_return = map_value(arg0, camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), _app_pos[0], _app_pos[2]);
    var _y_return = map_value(arg1, camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), _app_pos[1], _app_pos[3]);
    return [_x_return, _y_return];
}
