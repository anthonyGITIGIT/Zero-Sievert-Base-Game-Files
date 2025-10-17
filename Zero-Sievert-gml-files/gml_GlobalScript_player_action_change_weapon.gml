function player_action_change_weapon(arg0)
{
    if (weapon_slot_now != arg0)
    {
        reloading = false;
        alarm[0] = 1;
        action = true;
        switching_weapon = true;
        next_weapon_slot = arg0;
        switching_fase = 0;
    }
}
