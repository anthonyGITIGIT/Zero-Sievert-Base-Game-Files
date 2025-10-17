function end_game_create_choices()
{
    with (player_get_local())
        instance_create_depth(x, y, 0, obj_interact_end_game_options);
}
