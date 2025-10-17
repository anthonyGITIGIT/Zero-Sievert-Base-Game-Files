function is_in_shooting_range()
{
    return is_in_hub() && player_get_local().x >= 1278;
}
