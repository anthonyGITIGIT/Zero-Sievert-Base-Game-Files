function player_loadout_set_fire_mode(arg0, arg1)
{
    var _loot = player_loadout_get_loot(player_get_local(), arg0);
    
    if (!item_exists(loot_get_item(_loot)))
        exit;
    
    if (!variable_struct_exists(_loot, "weapon_fire_mode"))
    {
        trace_error("Cannot set fire mode on \"", _loot.item, "\"");
        exit;
    }
    
    _loot.weapon_fire_mode = arg1;
}
