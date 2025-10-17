function time_increment_hours(arg0)
{
    with (obj_light_controller)
    {
        var _old_hours = time_get_hours();
        var _old_day = time_get_days();
        game_time_played = date_inc_hour(game_time_played, arg0);
        
        if ((_old_hours < 7 || _old_day < time_get_days()) && time_get_hours() >= 7)
            time_restock_traders();
    }
}
