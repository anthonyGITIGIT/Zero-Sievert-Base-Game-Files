function class_npcr_recoil(arg0, arg1) constructor
{
    static NewCenter = function(arg0)
    {
        followed_target = arg0;
        var _targetx = followed_target.x;
        var _targety = followed_target.y;
        cross_center_x = lerp(cross_center_x, _targetx, cross_delay);
        cross_center_y = lerp(cross_center_y, _targety, cross_delay);
        radius_min = npc_get_recoil_radius_min(npc_id) * glance_get_npc_recoil_radius_multiplier(item_weapon_get_type_effective_range(npc_instance_id.arma_now));
        radius_max = npc_get_recoil_radius_max(npc_id) * glance_get_npc_recoil_radius_multiplier(item_weapon_get_type_effective_range(npc_instance_id.arma_now));
    };
    
    static MoveCrosshair = function()
    {
        var _speed = cross_speed;
        _speed = lerp(cross_speed, cross_speed_max, (radius_now - radius_min) / (radius_max - radius_min));
        cross_x += lengthdir_x(_speed, cross_direction_movement);
        cross_y += lengthdir_y(_speed, cross_direction_movement);
        
        if (point_distance(0, 0, cross_x, cross_y) >= radius_now)
        {
            cross_direction_movement = cross_direction_movement + 180 + (choose(-1, 1) * irandom_range(15, 30));
            off_center_counter_now++;
            
            if (off_center_counter_now >= off_center_counter_max)
            {
                off_center_counter_now = 0;
                ForceMiddle();
            }
        }
        
        NearCenter();
    };
    
    static SetAimDirection = function()
    {
        var _x = cross_center_x + cross_x;
        var _y = cross_center_y + cross_y;
        direction_aim = point_direction(npc_instance_id.x, npc_instance_id.y, _x, _y);
    };
    
    static IncreaseRadius = function(arg0)
    {
        radius_now += arg0;
        radius_now = clamp(radius_now, radius_min, radius_max);
    };
    
    static ForceMiddle = function()
    {
        var _dir = point_direction(cross_center_x, cross_center_y, cross_center_x + cross_x, cross_center_y + cross_y);
        cross_x = lengthdir_x(radius_now - 1, _dir);
        cross_y = lengthdir_y(radius_now - 1, _dir);
    };
    
    static StuckCheck = function()
    {
        if (point_distance(0, 0, cross_x, cross_y) >= radius_now)
        {
            offset_timer_now++;
            
            if (offset_timer_now >= offset_timer_max)
            {
                offset_timer_now = 0;
                ForceMiddle();
            }
        }
    };
    
    static NearCenter = function()
    {
        if (point_distance(cross_center_x, cross_center_y, cross_center_x + cross_x, cross_center_y + cross_y) < offset_center)
            off_center_counter_now = 0;
    };
    
    direction_aim = 0;
    radius_decreasing_value = -npc_get_recoil_radius_decrease();
    radius_min = npc_get_recoil_radius_min(arg0);
    radius_max = npc_get_recoil_radius_max(arg0);
    radius_now = npc_get_recoil_radius_min(arg0);
    cross_speed = npc_get_recoil_crosshair_speed();
    cross_speed_max = npc_get_recoil_crosshair_speed_max();
    cross_delay = npc_get_recoil_crosshair_delay(arg0);
    cross_center_x = 0;
    cross_center_y = 0;
    cross_x = 0;
    cross_y = 0;
    cross_direction_movement = 0;
    npc_instance_id = arg1;
    npc_id = arg0;
    followed_target = -4;
    offset = 2;
    offset_timer_now = 0;
    offset_timer_max = 20;
    off_center_counter_now = 0;
    off_center_counter_max = 3;
    offset_center = 5;
}
