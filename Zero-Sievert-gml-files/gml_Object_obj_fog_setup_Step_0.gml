player_follow_local();

if (player_exists_local())
{
    if (settings_get("FOG FOW"))
    {
        if (skill_hunter_obtained("doeeyed"))
            global.angle_fow = 90 + struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("doeeyed")), variable_get_hash("view_fov_bonus"));
        
        var _dir = point_direction(x, y, obj_cursor.aa_x, obj_cursor.aa_y) + 360;
        var _off = 650;
        var _angle_diff = global.angle_fow / 2;
        global.field_of_view_x1 = x + lengthdir_x(_off, _dir + _angle_diff);
        global.field_of_view_y1 = y + lengthdir_y(_off, _dir + _angle_diff);
        global.field_of_view_x2 = x + lengthdir_x(_off, _dir - _angle_diff);
        global.field_of_view_y2 = y + lengthdir_y(_off, _dir - _angle_diff);
    }
}

depth = 75;
