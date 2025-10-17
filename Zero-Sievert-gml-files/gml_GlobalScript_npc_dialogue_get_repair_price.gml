function npc_dialogue_get_repair_price()
{
    if (!player_exists_local())
        return 0;
    
    var _player = player_get_local();
    
    if (!item_fits_category(_player.armor_now, "armor"))
        return 0;
    
    return round((1 - (player_loadout_get_durability(_player, "armor slot") / 100)) * item_get_value(_player.armor_now) * 0.7);
}
