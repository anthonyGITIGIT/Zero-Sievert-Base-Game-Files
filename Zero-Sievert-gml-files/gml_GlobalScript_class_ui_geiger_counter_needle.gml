uiAddBoxType("UiGeigerCounterNeedle", class_ui_geiger_counter_needle);

function class_ui_geiger_counter_needle() : __uiClassCommon() constructor
{
    __radius = 0;
    __angle_offset = 0;
    VariableBind("radius", function()
    {
        return __radius;
    }, function(arg0)
    {
        __radius = arg0;
        Set("width", 2 * __radius);
        Set("height", 2 * __radius);
    });
    angle_offset = 0;
    angle_offset_max = 8;
    angle_step = 0;
    angle_step_max = 2;
    CallbackSetDraw(function()
    {
        if (angle_step < angle_step_max)
        {
            angle_step++;
        }
        else
        {
            angle_step = 0;
            angle_step_max = irandom(4) + 1;
            angle_offset += choose(-1.5, -1, -0.5, 0, 0.5, 1, 1.5);
            angle_offset = clamp(angle_offset, -angle_offset_max, angle_offset_max);
        }
        
        var _radiation = 0;
        
        if (is_in_raid() && instance_exists(obj_map_generator))
        {
            var _room_x = player_get_local().x div 8;
            var _room_y = (player_get_local().y + 8) div 8;
            _radiation = round(ds_grid_get(obj_map_generator.grid_radiation, _room_x, _room_y) ?? 0);
        }
        
        var _angle_offset = (_radiation >= 15) ? angle_offset : _radiation;
        var _angle = ((-180 * _radiation) / 15) + _angle_offset;
        draw_sprite_ext(s_pda_counter, 0, 0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), 4, 4, _angle, c_white, 1);
    });
}
