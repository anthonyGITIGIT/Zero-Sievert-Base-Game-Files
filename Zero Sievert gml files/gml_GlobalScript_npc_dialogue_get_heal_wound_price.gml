function npc_dialogue_get_heal_wound_price()
{
    if (!player_exists_local())
        return 0;
    
    return floor(player_get_local().wound * global.heal_wound_k);
}
