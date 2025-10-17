function scr_enemy_target_inside_cone()
{
    var _lo_vedo = false;
    
    if (instance_exists(target))
    {
        if (instance_line_of_sight(x, y, target))
        {
            var alert_distance = npc_get_alert_visual_distance(npc_id);
            var alert_angle = npc_get_alert_radius(npc_id);
            var lc = obj_light_controller;
            var t_hm = time_get_hours_fraction();
            var k = 1.25;
            
            if (lc.ciclo_now == UnknownEnum.Value_3)
            {
                alert_distance = npc_get_alert_visual_distance(npc_id) / k;
                alert_angle = npc_get_alert_radius(npc_id) / k;
            }
            
            if (lc.ciclo_now == UnknownEnum.Value_0)
            {
                var hours_sunrise = lc.ciclo_time[UnknownEnum.Value_1] - lc.ciclo_time[UnknownEnum.Value_0];
                var amount = (t_hm - lc.ciclo_time[UnknownEnum.Value_0]) / hours_sunrise;
                alert_angle = lerp(npc_get_alert_radius(npc_id) / k, npc_get_alert_radius(npc_id), amount);
                alert_distance = lerp(npc_get_alert_visual_distance(npc_id) / k, npc_get_alert_visual_distance(npc_id), amount);
            }
            
            if (lc.ciclo_now == UnknownEnum.Value_2)
            {
                var hours_sunrise = lc.ciclo_time[UnknownEnum.Value_3] - lc.ciclo_time[UnknownEnum.Value_2];
                var amount = (t_hm - lc.ciclo_time[UnknownEnum.Value_2]) / hours_sunrise;
                alert_angle = lerp(npc_get_alert_radius(npc_id), npc_get_alert_radius(npc_id) / k, amount);
                alert_distance = lerp(npc_get_alert_visual_distance(npc_id), npc_get_alert_visual_distance(npc_id) / k, amount);
            }
            
            alert_distance = scr_npc_oval_view(alert_distance, weapon_pointing_direction);
            var x2 = x + lengthdir_x(alert_distance, weapon_pointing_direction + (alert_angle / 2));
            var y2 = y + lengthdir_y(alert_distance, weapon_pointing_direction + (alert_angle / 2));
            var x3 = x + lengthdir_x(alert_distance, weapon_pointing_direction - (alert_angle / 2));
            var y3 = y + lengthdir_y(alert_distance, weapon_pointing_direction - (alert_angle / 2));
            
            if (point_distance(x, y, target.x, target.y) <= (npc_get_alert_min_distance(npc_id) * 1.5))
                _lo_vedo = true;
            
            if (point_in_triangle(target.x, target.y, x, y, x2, y2, x3, y3))
                _lo_vedo = true;
        }
    }
    
    return _lo_vedo;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
