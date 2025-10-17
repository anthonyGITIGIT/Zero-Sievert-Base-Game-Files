function scr_check_fast_position(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    if (arg0 >= (arg3 - arg2) && (arg0 + arg7) <= (arg3 + arg5 + arg2) && arg1 >= (arg4 - arg2) && (arg1 + arg8) <= (arg4 + arg6 + arg2))
        return true;
    else
        return false;
}
