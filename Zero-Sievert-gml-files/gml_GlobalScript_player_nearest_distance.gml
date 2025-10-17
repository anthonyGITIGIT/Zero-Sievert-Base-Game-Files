function player_nearest_distance(arg0, arg1)
{
    var _player = player_nearest_instance(arg0, arg1);
    
    if (!instance_exists(_player))
        return infinity;
    
    return point_distance(arg0, arg1, _player.x, _player.y);
}
