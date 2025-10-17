function bullet_find_spawn_location(arg0, arg1)
{
    if (!object_is_player(id))
    {
        return 
        {
            x: arg0,
            y: arg1
        };
    }
    
    var _player_x = weapon_holder.x;
    var _player_y = weapon_holder.y;
    draw_set_colour(c_white);
    draw_line(arg0, arg1, _player_x, _player_y);
    var _point = collision_line_get_point(_player_x, _player_y, arg0, arg1, obj_solid, 2);
    var _return_x = _point[0];
    var _return_y = _point[1];
    return 
    {
        x: _return_x,
        y: _return_y
    };
}
