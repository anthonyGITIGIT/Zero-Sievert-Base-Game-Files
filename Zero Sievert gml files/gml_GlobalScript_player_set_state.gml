function player_set_state(arg0, arg1 = 0)
{
    var _player = player_get(arg1);
    
    if (instance_exists(_player))
        _player.state = arg0;
}
