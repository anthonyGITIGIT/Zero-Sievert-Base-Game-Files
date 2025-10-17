frame--;

if (frame < 0)
{
    player_action_throw_bolt();
    instance_destroy();
}
