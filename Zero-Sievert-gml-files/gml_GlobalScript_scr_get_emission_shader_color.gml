function scr_get_emission_shader_color(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var _lerp = arg0;
    var _red_min = arg1;
    var _red_max = arg2;
    var _green_min = arg3;
    var _green_max = arg4;
    var _blue_min = arg5;
    var _blue_max = arg6;
    
    if (_lerp == false)
    {
        global.emission_shader_red_now = _red_max;
        global.emission_shader_blue_now = _green_max;
        global.emission_shader_green_now = _blue_max;
    }
    
    if (_lerp == true)
    {
        var _div = global.emission_timer_now / global.emission_timer[global.state_emission_now];
        global.emission_shader_red_now = lerp(_red_min, _red_max, _div);
        global.emission_shader_blue_now = lerp(_blue_min, _blue_max, _div);
        global.emission_shader_green_now = lerp(_green_min, _green_max, _div);
    }
}
