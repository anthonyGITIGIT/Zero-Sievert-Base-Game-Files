function player_get_state(arg0 = 0)
{
    var _player = player_get(arg0);
    return instance_exists(_player) ? _player.state : undefined;
}
