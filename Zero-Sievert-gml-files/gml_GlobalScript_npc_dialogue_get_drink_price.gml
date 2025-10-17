function npc_dialogue_get_drink_price()
{
    if (!player_exists_local())
        return 0;
    
    return floor((100 - player_get_local().thirst) * global.refill_thirst_k);
}
