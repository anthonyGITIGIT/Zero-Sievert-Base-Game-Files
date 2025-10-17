function pp_colour_change_highlights_threshold(arg0 = 0.4, arg1 = 0)
{
    with (obj_shader_controller)
    {
        var _this_struct = u_threshold_highlight[0];
        
        if (arg1 <= 0)
        {
            _this_struct.value = arg0;
            _this_struct.frame = 0;
            exit;
        }
        
        _this_struct.goto_value = arg0;
        _this_struct.frames = arg1;
        _this_struct.frame = arg1;
        _this_struct.amount_to_change = (arg0 - _this_struct.value) / arg1;
    }
}
