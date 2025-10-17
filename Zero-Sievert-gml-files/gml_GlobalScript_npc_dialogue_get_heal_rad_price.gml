function npc_dialogue_get_heal_rad_price()
{
    if (!player_exists_local())
        return 0;
    
    return floor(player_get_local().radiation_accumulata * global.heal_rad_k);
}
