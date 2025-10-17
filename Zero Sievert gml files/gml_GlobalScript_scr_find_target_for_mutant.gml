function scr_find_target_for_mutant(arg0)
{
    var alert_distance = arg0;
    
    if (instance_exists(obj_light_controller))
    {
        var lc = obj_light_controller;
        var t_hm = time_get_hours_fraction();
        var k = 1.5;
        
        if (lc.ciclo_now == UnknownEnum.Value_3)
        {
            alert_distance = npc_get_alert_visual_distance(npc_id) / k;
            alert_angle = npc_get_alert_radius(npc_id) / k;
        }
        
        if (lc.ciclo_now == UnknownEnum.Value_0)
        {
            var hours_sunrise = lc.ciclo_time[UnknownEnum.Value_1] - lc.ciclo_time[UnknownEnum.Value_0];
            var amount = (t_hm - lc.ciclo_time[UnknownEnum.Value_0]) / hours_sunrise;
            alert_distance = lerp(npc_get_alert_visual_distance(npc_id) / k, npc_get_alert_visual_distance(npc_id), amount);
        }
        
        if (lc.ciclo_now == UnknownEnum.Value_2)
        {
            var hours_sunrise = lc.ciclo_time[UnknownEnum.Value_3] - lc.ciclo_time[UnknownEnum.Value_2];
            var amount = (t_hm - lc.ciclo_time[UnknownEnum.Value_2]) / hours_sunrise;
            alert_distance = lerp(npc_get_alert_visual_distance(npc_id), npc_get_alert_visual_distance(npc_id) / k, amount);
        }
    }
    
    var n = -4;
    var d = alert_distance;
    
    with (obj_npc_parent)
    {
        if (faction != other.faction && faction != "All Friend")
        {
            if (distance_to_object(other) <= d)
            {
                if (instance_line_of_sight(x, y, other))
                {
                    n = id;
                    search_target_id = id;
                    d = point_distance(n.x, n.y, x, y);
                }
            }
        }
    }
    
    var _nearest_player = player_nearest_instance(x, y);
    
    if (instance_exists(_nearest_player))
    {
        var _player_index = _nearest_player.mp_index;
        
        if (!player_state_is(_player_index, scr_player_state_start, scr_player_state_free_camera))
        {
            var _distance_to_player = player_distance(x, y, _player_index);
            
            if (_distance_to_player <= d)
            {
                if (instance_line_of_sight(x, y, _nearest_player))
                {
                    alert_player += (alert_distance / max(1, _distance_to_player));
                    
                    if (alert_player >= alert_player_max)
                    {
                        n = _nearest_player;
                        search_target_id = _nearest_player;
                    }
                }
            }
        }
    }
    
    if (instance_exists(target))
    {
        if (target != -4 && n == -4)
        {
            if (point_distance(x, y, target.x, target.y) < 280)
                n = target;
        }
    }
    
    if (!instance_exists(n))
        n = -4;
    
    return n;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
