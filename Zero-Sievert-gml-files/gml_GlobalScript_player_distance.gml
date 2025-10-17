function player_distance(arg0, arg1, arg2 = 0)
{
    var _player = player_get(arg2);
    
    if (!instance_exists(_player))
        return infinity;
    
    return point_distance(arg0, arg1, _player.x, _player.y);
}
