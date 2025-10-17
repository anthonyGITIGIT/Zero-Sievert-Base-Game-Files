function player_line_of_sight(arg0, arg1, arg2 = player_get_local_index())
{
    var _player = player_get(arg2);
    
    if (!instance_exists(_player))
        return undefined;
    
    var _player_x = _player.x;
    var _player_y = _player.y;
    
    if (collision_line(arg0, arg1, _player_x, _player_y, obj_solid, true, true))
        return false;
    
    if (settings_get("FOG FOW") && !point_in_triangle(arg0, arg1, _player_x, _player_y, global.field_of_view_x1, global.field_of_view_y1, global.field_of_view_x2, global.field_of_view_y2) && point_distance(arg0, arg1, _player_x, _player_y) > global.fow_minimun_dis)
        return false;
    
    return true;
}
