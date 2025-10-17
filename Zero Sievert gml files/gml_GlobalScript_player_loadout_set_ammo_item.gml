function player_loadout_set_ammo_item(arg0, arg1)
{
    var _loot = player_loadout_get_loot(player_get_local(), arg0);
    
    if (!item_exists(loot_get_item(_loot)))
        exit;
    
    if (!variable_struct_exists(_loot, "ammo_id"))
    {
        trace_error("Cannot set ammo item on \"", _loot.item, "\"");
        exit;
    }
    
    _loot.ammo_id = arg1;
}
