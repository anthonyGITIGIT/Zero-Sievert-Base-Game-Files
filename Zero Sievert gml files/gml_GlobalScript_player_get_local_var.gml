function player_get_local_var(arg0, arg1 = 0)
{
    return player_get_var(arg0, player_get_local_index(), arg1);
}
