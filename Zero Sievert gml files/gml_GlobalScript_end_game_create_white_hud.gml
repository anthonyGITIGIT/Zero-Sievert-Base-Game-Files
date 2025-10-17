function end_game_create_white_hud()
{
    var _fade = instance_create_depth(x, y, 0, obj_hud_white_fade);
    _fade.timer_full_white = 180;
}
