function pp_colour_change_rgb(arg0 = 1, arg1 = 1, arg2 = 1, arg3 = 0)
{
    with (obj_shader_controller)
    {
        if (arg3 <= 0)
        {
            u_contrast_r[0].value = arg0;
            u_contrast_r[0].frame = 0;
            u_contrast_g[0].value = arg1;
            u_contrast_g[0].frame = 0;
            u_contrast_b[0].value = arg2;
            u_contrast_b[0].frame = 0;
            exit;
        }
        
        var _this_struct = u_contrast_r[0];
        _this_struct.goto_value = arg0;
        _this_struct.frames = arg3;
        _this_struct.frame = arg3;
        _this_struct.amount_to_change = (_this_struct.goto_value - _this_struct.value) / arg3;
        _this_struct = u_contrast_g[0];
        _this_struct.goto_value = arg1;
        _this_struct.frames = arg3;
        _this_struct.frame = arg3;
        _this_struct.amount_to_change = (_this_struct.goto_value - _this_struct.value) / arg3;
        _this_struct = u_contrast_b[0];
        _this_struct.goto_value = arg2;
        _this_struct.frames = arg3;
        _this_struct.frame = arg3;
        _this_struct.amount_to_change = (_this_struct.goto_value - _this_struct.value) / arg3;
    }
}
