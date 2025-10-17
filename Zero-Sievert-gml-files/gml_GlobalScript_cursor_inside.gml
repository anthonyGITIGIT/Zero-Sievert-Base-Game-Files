function cursor_inside(arg0, arg1, arg2, arg3)
{
    if (obj_cursor.aa_x >= arg0 && obj_cursor.aa_x <= (arg0 + arg2) && obj_cursor.aa_y >= arg1 && obj_cursor.aa_y < (arg1 + arg3))
        return true;
    
    return false;
}
