function player_step_shooting_range()
{
    if (!is_in_shooting_range())
        exit;
    
    var _input = false;
    
    if (!obj_gamepad.last_input_keyboard)
    {
        if (obj_gamepad.input_pressed[UnknownEnum.Value_3])
            _input = true;
    }
    else if (keyboard_check_pressed(vk_space))
    {
        _input = true;
    }
    
    if (_input)
    {
        var camx = camera_get_view_x(view_camera[0]);
        var camy = camera_get_view_y(view_camera[0]);
        var _x1 = 1278;
        var _x2 = 1930;
        var _y1 = 690;
        var _y2 = 835;
        
        if (cursor_inside(_x1, _y1, _x2 - _x1, _y2 - _y1))
        {
            var _dummy = instance_create_depth(obj_cursor.aa_x, obj_cursor.aa_y, 0, obj_dummy_bunker);
            
            switch (global.sr_class_now)
            {
                case 0:
                    _dummy.armor_id = "no_item";
                    break;
                
                case 1:
                    _dummy.armor_id = "armor_bandit_1";
                    break;
                
                case 2:
                    _dummy.armor_id = "armor_loner_0";
                    break;
                
                case 3:
                    _dummy.armor_id = "armor_loner_1";
                    break;
                
                case 4:
                    _dummy.armor_id = "armor_loner_2";
                    break;
                
                case 5:
                    _dummy.armor_id = "armor_loner_3";
                    break;
                
                case 6:
                    _dummy.armor_id = "armor_loner_cyclops";
                    break;
            }
            
            with (_dummy)
            {
                if (armor_id == "no_item")
                {
                    sprite_idle = s_pg1_idle;
                    sprite_move = s_pg1_run;
                    sprite_dead = s_pg1_dead;
                }
                else
                {
                    sprite_idle = npc_set_sprite_idle(npc_id, armor_id);
                    sprite_move = npc_set_sprite_move(npc_id, armor_id);
                    sprite_dead = npc_set_sprite_dead(npc_id, armor_id);
                }
            }
        }
        else
        {
            scr_draw_text_with_box("Invalid location");
        }
    }
}

enum UnknownEnum
{
    Value_3 = 3
}
