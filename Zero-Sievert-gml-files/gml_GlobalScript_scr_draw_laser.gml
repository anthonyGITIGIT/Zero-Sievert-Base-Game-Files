function scr_draw_laser(arg0)
{
    var _laser_struct = variable_struct_get(laser_container_array[weapon_slot_now].data, arg0);
    
    if (_laser_struct.on)
    {
        var dir;
        
        if (image_xscale < 0)
            dir = weapon_holder.image_angle + 180;
        else
            dir = weapon_holder.image_angle;
        
        var _color = _laser_struct.color;
        var start_x = x + _laser_struct.x;
        var start_y = y + _laser_struct.y;
        var temp_x = start_x;
        var temp_y = start_y;
        var xp = start_x;
        var yp = start_y;
        var collision = position_meeting(temp_x, temp_y, obj_solid);
        
        while (!collision && distance_to_point(temp_x, temp_y) < 420)
        {
            xp = temp_x;
            yp = temp_y;
            temp_x += lengthdir_x(4, dir);
            temp_y += lengthdir_y(4, dir);
            var collision1 = position_meeting(temp_x, temp_y, obj_solid);
            var collision2 = position_meeting(temp_x, temp_y, obj_npc_parent);
            collision = collision1 + collision2;
        }
        
        draw_line_width_color(start_x, start_y, temp_x, temp_y, 0.5, _color, _color);
    }
}
