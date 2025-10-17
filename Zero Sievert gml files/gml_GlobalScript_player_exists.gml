function player_exists(arg0 = 0)
{
    with (obj_player_parent)
    {
        if (mp_index == arg0)
            return true;
    }
    
    return false;
}
