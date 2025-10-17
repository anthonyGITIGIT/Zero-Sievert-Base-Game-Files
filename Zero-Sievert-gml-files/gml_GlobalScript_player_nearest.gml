function player_nearest(arg0, arg1)
{
    var _player = player_nearest_instance(arg0, arg1);
    return instance_exists(_player) ? _player.mp_index : -1;
}
