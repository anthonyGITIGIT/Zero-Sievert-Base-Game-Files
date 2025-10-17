function time_get_seconds()
{
    with (obj_light_controller)
        return date_get_second(game_time_played);
    
    return 0;
}
