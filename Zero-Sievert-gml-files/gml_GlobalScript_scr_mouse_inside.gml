function scr_mouse_inside(arg0, arg1, arg2, arg3)
{
    if (mouse_x >= arg0 && mouse_x <= (arg0 + arg2) && mouse_y >= arg1 && mouse_y < (arg1 + arg3))
        return true;
}
