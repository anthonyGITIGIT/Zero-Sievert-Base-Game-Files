function player_step_debug_prevent_death()
{
    if (global.general_debug)
    {
        hp = clamp(hp, hp_max_total, 999);
        stamina = 100;
        bleed = 0;
    }
}
