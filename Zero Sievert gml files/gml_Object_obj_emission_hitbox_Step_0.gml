x += hspd;

if (player_meeting_local(x, y))
{
    if (!player_hitted)
    {
        if (!player_get_local().emission_riparato)
        {
            player_hitted = true;
            player_damage_local(50);
        }
    }
}
