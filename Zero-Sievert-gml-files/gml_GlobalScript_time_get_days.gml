function time_get_days()
{
    with (obj_light_controller)
        return date_get_day(game_time_played);
    
    return 10;
}
