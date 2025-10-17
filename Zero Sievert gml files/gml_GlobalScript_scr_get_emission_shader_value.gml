function scr_get_emission_shader_value(arg0, arg1, arg2, arg3, arg4)
{
    var _lerp = arg0;
    var _brightness_min = arg1;
    var _brightness_max = arg2;
    var _contrast_min = arg3;
    var _contrast_max = arg4;
    
    if (_lerp == false)
    {
        global.emission_shader_brightness_now = _brightness_max;
        global.emission_shader_contrast_now = _contrast_max;
    }
    
    if (_lerp == true)
    {
        var _div = global.emission_timer_now / global.emission_timer[global.state_emission_now];
        global.emission_shader_brightness_now = lerp(_brightness_min, _brightness_max, _div);
        global.emission_shader_contrast_now = lerp(_contrast_min, _contrast_max, _div);
    }
}
