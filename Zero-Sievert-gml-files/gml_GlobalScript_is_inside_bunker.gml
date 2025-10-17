function is_inside_bunker()
{
    if (player_exists_local() && is_in_hub() && player_get_local().y < 1146)
        return true;
    
    return false;
}
