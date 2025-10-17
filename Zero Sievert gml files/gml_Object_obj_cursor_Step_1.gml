aim_assist_snapped_to = -4;
aa_x = x;
aa_y = y;

if (active && instance_exists(obj_player))
{
    var _camx = round(camera_get_view_x(view_camera[0]));
    var _camy = round(camera_get_view_y(view_camera[0]));
    mouse_x_last = x;
    mouse_y_last = y;
    var _win_width = window_get_width();
    var _win_height = window_get_height();
    var _win_middle_h = _win_width / 2;
    var _win_middle_v = _win_height / 2;
    var _change_amount_x = (display_mouse_get_x() - window_get_x() - _win_middle_h) * mouse_sensitivity;
    var _change_amount_y = (display_mouse_get_y() - window_get_y() - _win_middle_v) * mouse_sensitivity;
    x += _change_amount_x;
    y += _change_amount_y;
    var _player = player_get_local();
    var _to_follow_x = camera_get_view_x(view_camera[0]);
    var _to_follow_y = camera_get_view_y(view_camera[0]);
    x += (_to_follow_x - goto_x_last);
    y += (_to_follow_y - goto_y_last);
    goto_x_last = _to_follow_x;
    goto_y_last = _to_follow_y;
    
    if (!__uiGlobal().__defaultOnion.HasInputReceiver() && !player_local_state_is(scr_player_state_start, scr_player_state_dead) && game_in_focus())
    {
        window_mouse_set(_win_middle_h, _win_middle_v);
        
        if (on_ui_last_frame)
        {
            x = mouse_x;
            y = mouse_y;
        }
        
        on_ui_last_frame = false;
    }
    else
    {
        x = mouse_x;
        y = mouse_y;
        on_ui_last_frame = true;
    }
    
    follow_now_before = follow_now;
    aa_x = x;
    aa_y = y;
    
    if (aim_assist_on == true && ((!!obj_gamepad.last_input_keyboard && global.gamepad_data.gamepad.aim_assist_on_mouse) || (!obj_gamepad.last_input_keyboard && global.gamepad_data.gamepad.aim_assist_on_gamepad)))
    {
        if (obj_gamepad.action[UnknownEnum.Value_28].value)
        {
            var _aa_inside_magnet = false;
            var _aa_inst = -4;
            var _aa_distance = infinity;
            
            with (obj_npc_parent)
            {
                if (scr_enemy_can_be_targeted(id))
                {
                    var _distance = point_distance(other.x, other.y, x, y);
                    
                    if (_distance < _aa_distance)
                    {
                        _aa_inside_magnet = true;
                        _aa_inst = id;
                        _aa_distance = _distance;
                    }
                }
            }
            
            if (_aa_inside_magnet)
            {
                var _magnet_amount = 1;
                
                if (_aa_distance <= aim_assist_precision_distance)
                {
                    _magnet_amount = _aa_distance / aim_assist_precision_distance;
                    _magnet_amount += ((1 - _magnet_amount) * ((aim_assist_precision_amount - 1) * -1));
                    _magnet_amount = clamp(_magnet_amount, 0, 1);
                    aim_assist_snapped_to = _aa_inst;
                }
                
                aa_x = lerp(_aa_inst.x, x, _magnet_amount);
                aa_y = lerp(_aa_inst.y, y, _magnet_amount);
            }
        }
        else
        {
            var _aa_targets = [];
            
            with (obj_npc_parent)
            {
                if (scr_enemy_can_be_targeted(id))
                {
                    var _angle_of_target = point_direction(_player.x, _player.y, x, y);
                    var _angle_of_cursor = obj_gamepad.input_decimal[UnknownEnum.Value_27];
                    
                    if (abs(angle_difference(_angle_of_target, _angle_of_cursor)) < other.aim_assist_radial_angle)
                        array_push(_aa_targets, id);
                }
            }
            
            var _aa_inside_angle = false;
            var _aa_inst = -4;
            var _aa_distance = infinity;
            var _target_count = array_length(_aa_targets);
            
            for (var i = 0; i < _target_count; i++)
            {
                with (_aa_targets[i])
                {
                    if (scr_enemy_can_be_targeted(id))
                    {
                        var _distance = point_distance(other.x, other.y, x, y);
                        
                        if (_distance < _aa_distance)
                        {
                            _aa_inside_angle = true;
                            _aa_inst = id;
                            _aa_distance = _distance;
                        }
                    }
                }
            }
            
            if (_aa_inside_angle)
            {
                var _angle_of_target = point_direction(_player.x, _player.y, _aa_inst.x, _aa_inst.y);
                var _angle_of_cursor = obj_gamepad.input_decimal[UnknownEnum.Value_27];
                var _magnet_amount = angle_difference(_angle_of_target, _angle_of_cursor) / aim_assist_radial_angle;
                aim_assist_snapped_to = _aa_inst;
                obj_gamepad.aim_assist_override_angle = _magnet_amount * abs(_magnet_amount) * aim_assist_radial_amount * 4;
            }
            
            if (aim_retract_on)
            {
                var _aa_target_found = false;
                _aa_inst = -4;
                var _list = ds_list_create();
                var _num = collision_line_list(_player.x, _player.y, _player.x + lengthdir_x(1000, obj_gamepad.input_decimal[UnknownEnum.Value_27]), _player.y + lengthdir_y(1000, obj_gamepad.input_decimal[UnknownEnum.Value_27]), obj_npc_parent, false, true, _list, true);
                
                if (_num > 0)
                {
                    for (var i = 0; i < _num; i++)
                    {
                        with (ds_list_find_value(_list, i))
                        {
                            if (scr_enemy_can_be_targeted(id))
                            {
                                _aa_target_found = true;
                                _aa_distance = point_distance(_player.x, _player.y, x, y);
                            }
                        }
                        
                        break;
                    }
                }
                
                ds_list_destroy(_list);
                
                if (_aa_target_found)
                {
                    if (_aa_distance < global.gamepad_data.gamepad.radial_distance_max)
                        obj_gamepad.aim_assist_override_distance = _aa_distance;
                }
            }
        }
    }
    
    cursor_has_moved();
}

enum UnknownEnum
{
    Value_27 = 27,
    Value_28
}
