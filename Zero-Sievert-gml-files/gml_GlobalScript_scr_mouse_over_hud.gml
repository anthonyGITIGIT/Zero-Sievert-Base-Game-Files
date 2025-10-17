function scr_mouse_over_hud(arg0, arg1, arg2, arg3)
{
    if (__uiGlobal().__defaultOnion.HasInputReceiver())
        return false;
    
    return obj_cursor.x >= arg0 && obj_cursor.x <= (arg0 + arg2) && obj_cursor.y >= arg1 && obj_cursor.y < (arg1 + arg3);
}
