function scr_check_position_free(arg0, arg1)
{
    var _x = arg0 div 16;
    var _y = arg1 div 16;
    var _ret = false;
    
    if (is_in_raid())
    {
        if (ds_grid_get(obj_controller.grid_motion, _x, _y) == 0)
            _ret = true;
        else
            _ret = false;
    }
    else
    {
        _ret = true;
    }
    
    return _ret;
}
