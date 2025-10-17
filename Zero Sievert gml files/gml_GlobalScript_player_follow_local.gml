function player_follow_local()
{
    if (player_exists_local())
    {
        x = player_get_local().x;
        y = player_get_local().y;
    }
}
