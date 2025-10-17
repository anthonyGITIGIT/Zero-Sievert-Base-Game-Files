function end_game_create_extraction_point()
{
    var _extraction = instance_create_depth(player_get_local().x, player_get_local().y, 0, obj_extraction_point);
    _extraction.timer_exit_max = 120;
    _extraction.draw_timer = false;
    _extraction.draw_smoke = false;
}
