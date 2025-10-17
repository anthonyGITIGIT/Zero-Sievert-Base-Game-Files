alpha += a;

if (alpha >= 1 && !pausa)
{
    alarm[0] = time_black;
    pausa = true;
}

if (alpha <= 0)
{
    player_set_local_state(scr_player_state_move);
    instance_destroy();
}

alpha = clamp(alpha, 0, 1);
