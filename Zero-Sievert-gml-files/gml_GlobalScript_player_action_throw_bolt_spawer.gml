function player_action_throw_bolt_spawer()
{
    instance_create_depth(player_get_local_var("x", 0), player_get_local_var("y", 0), player_get_local_var("depth", 0), obj_bolt_throw_on_gamepad);
}
