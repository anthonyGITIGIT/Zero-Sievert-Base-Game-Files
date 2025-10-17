if (chest_is_from_enemy(tipo))
{
    if (y < 4800 && is_in_raid())
    {
        if (tipo != "crow" && tipo != "rabbit")
        {
            if (crow_spawned == false)
            {
                if (current_time >= crow_timer_max)
                {
                    crow_spawned = true;
                    
                    if (scr_chance(50))
                    {
                        repeat (1)
                        {
                            var range = 300;
                            var dir = irandom_range(45, 135);
                            var xx = x + lengthdir_x(range, dir);
                            var yy = y + lengthdir_y(range, dir);
                            var cc = instance_create_depth(xx, yy, 0, obj_enemy_crow);
                            cc.state = "crow_move_to_target";
                            cc.move_point_x = x + choose(-7, 7);
                            cc.move_point_y = y + choose(-3, 3);
                        }
                    }
                }
            }
        }
    }
}

if (!is_in_hub())
{
    if (global.sk_k[UnknownEnum.Value_9] || skill_hunter_obtained("xrayview"))
    {
        image_alpha = 1;
    }
    else
    {
        var _visibility = player_line_of_sight(x, y);
        
        if (_visibility == undefined)
        {
        }
        else if (_visibility)
        {
            image_alpha = min(1, image_alpha + a_gain);
        }
        else
        {
            timer_visible++;
            
            if (timer_visible >= timer_visible_max)
                image_alpha = max(0, image_alpha - (a_gain / 2));
        }
    }
}

enum UnknownEnum
{
    Value_9 = 9
}
