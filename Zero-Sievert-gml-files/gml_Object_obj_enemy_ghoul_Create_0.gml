event_inherited();

if (is_in_raid())
{
    if (scr_chance(10) && quest_is_complete("clear_swamp"))
        npc_setup("ghoul_2");
    else
        npc_setup("ghoul");
}
else
{
    npc_setup("ghoul");
}
