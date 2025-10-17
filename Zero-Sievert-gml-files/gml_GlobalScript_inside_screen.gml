function inside_screen(arg0, arg1, arg2 = 0)
{
    var _camx = camera_get_view_x(view_camera[0]);
    var _camy = camera_get_view_y(view_camera[0]);
    
    if (arg0 >= _camx && arg0 < (_camx + 480) && arg1 >= _camy && arg1 < (_camy + 270))
        return true;
    
    return false;
}
