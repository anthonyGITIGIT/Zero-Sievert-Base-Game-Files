function time_get_hours()
{
    with (obj_light_controller)
        return date_get_hour(game_time_played);
    
    return 10;
}
