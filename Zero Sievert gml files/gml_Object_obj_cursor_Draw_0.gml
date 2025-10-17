if (instance_exists(aim_assist_snapped_to))
{
    draw_set_colour(c_aqua);
    draw_circle(aa_x, aa_y, 8, true);
}

if (obj_gamepad.action[UnknownEnum.Value_28].value || !!obj_gamepad.last_input_keyboard)
{
    draw_set_colour(c_green);
    draw_circle(x, y, 8, true);
    draw_circle(x, y, 2, false);
    draw_set_colour(c_white);
    draw_circle(x, y, 2, true);
}
else if (instance_exists(player_get_local()))
{
    var _ratio = 1920 / window_get_width();
    var _dist_min = global.gamepad_data.gamepad.radial_distance_min / _ratio;
    var _dist_max = global.gamepad_data.gamepad.radial_distance_max / _ratio;
    var _dist = lerp(_dist_min, _dist_max, obj_gamepad.input_decimal[UnknownEnum.Value_26]);
    var _player = player_get_local();
    goto_x = _player.x + lengthdir_x(_dist, obj_gamepad.input_decimal[UnknownEnum.Value_27]);
    goto_y = _player.y + lengthdir_y(_dist, obj_gamepad.input_decimal[UnknownEnum.Value_27]);
    draw_set_colour(c_green);
    draw_circle(goto_x, goto_y, 8, true);
    draw_circle(goto_x, goto_y, 2, false);
    draw_set_colour(c_white);
    draw_circle(goto_x, goto_y, 2, true);
    draw_set_colour(c_dkgray);
    draw_line(_player.x, _player.y, _player.x + lengthdir_x(100, obj_gamepad.input_decimal[UnknownEnum.Value_27] + aim_assist_radial_angle), _player.y + lengthdir_y(100, obj_gamepad.input_decimal[UnknownEnum.Value_27] + aim_assist_radial_angle));
    draw_line(_player.x, _player.y, _player.x + lengthdir_x(100, obj_gamepad.input_decimal[UnknownEnum.Value_27] - aim_assist_radial_angle), _player.y + lengthdir_y(100, obj_gamepad.input_decimal[UnknownEnum.Value_27] - aim_assist_radial_angle));
}

with (obj_npc_parent)
{
    if (obj_gamepad.action[UnknownEnum.Value_28].value || !!obj_gamepad.last_input_keyboard)
    {
        if (scr_enemy_can_be_targeted(id))
        {
            draw_set_colour(c_black);
            draw_circle(x, y, other.aim_assist_precision_distance, true);
            
            if (other.aim_assist_snapped_to == id)
            {
                draw_set_colour(c_blue);
                draw_circle(x, y, other.aim_assist_precision_distance, true);
            }
        }
    }
    else if (scr_enemy_can_be_targeted(id))
    {
        var _player = player_get_local();
        var _angle_of_target = point_direction(_player.x, _player.y, x, y);
        var _angle_of_cursor = obj_gamepad.input_decimal[UnknownEnum.Value_27];
        
        if (abs(angle_difference(_angle_of_target, _angle_of_cursor)) < other.aim_assist_radial_angle)
        {
            draw_set_colour(c_black);
            draw_circle(x, y, 10, true);
            draw_circle(x, y, 8, true);
            draw_circle(x, y, 6, true);
        }
        
        if (other.aim_assist_snapped_to == id)
        {
            draw_set_colour(c_blue);
            draw_circle(x, y, 10, true);
            draw_circle(x, y, 8, true);
            draw_circle(x, y, 6, true);
        }
    }
}

draw_set_colour(c_white);

enum UnknownEnum
{
    Value_26 = 26,
    Value_27,
    Value_28
}
