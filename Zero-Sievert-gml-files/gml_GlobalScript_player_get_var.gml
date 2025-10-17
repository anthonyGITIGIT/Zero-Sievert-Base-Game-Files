function player_get_var(arg0, arg1 = 0, arg2 = 0)
{
    var _player = player_get(arg1);
    
    if (instance_exists(_player))
        return variable_instance_get(_player, arg0);
    
    return arg2;
}
