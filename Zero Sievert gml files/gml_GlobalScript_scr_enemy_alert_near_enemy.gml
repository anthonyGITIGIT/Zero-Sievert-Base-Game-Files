function scr_enemy_alert_near_enemy()
{
    var my_faction = npc_get_faction(npc_id);
    var my_target = target;
    var my__id = id;
    var xx = x;
    var yy = y;
    
    with (obj_npc_parent)
    {
        if (point_distance(x, y, xx, yy) < 200)
        {
            if (npc_get_faction(npc_id) == my_faction)
            {
                if (id != my__id)
                {
                    if (scr_chance(100))
                    {
                        if (instance_exists(target))
                        {
                            if (target_relation == UnknownEnum.Value_0 || target_relation == UnknownEnum.Value_1)
                            {
                                state = "human_alert";
                                target = my_target;
                                target_relation = UnknownEnum.Value_2;
                            }
                        }
                        
                        if (target == -4)
                        {
                            state = "human_alert";
                            target = my_target;
                            target_relation = UnknownEnum.Value_2;
                        }
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
