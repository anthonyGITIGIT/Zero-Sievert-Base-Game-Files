function player_get(arg0 = 0)
{
    with (obj_player_parent)
    {
        if (mp_index == arg0)
            return id;
    }
    
    return -4;
}
