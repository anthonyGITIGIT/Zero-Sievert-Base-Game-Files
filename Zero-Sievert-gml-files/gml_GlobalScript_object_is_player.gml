function object_is_player(arg0)
{
    if (arg0 >= 100000)
    {
        if (!instance_exists(arg0))
            return false;
        
        arg0 = arg0.object_index;
    }
    
    return arg0 == obj_player || arg0 == obj_player_puppet;
}
