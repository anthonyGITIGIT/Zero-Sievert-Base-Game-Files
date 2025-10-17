function player_loadout_set_jammed(arg0, arg1)
{
    var _loot = player_loadout_get_loot(player_get_local(), arg0);
    
    if (!item_exists(loot_get_item(_loot)))
        exit;
    
    if (!variable_struct_exists(_loot, "jammed"))
    {
        _loot.jammed = false;
        exit;
    }
    
    _loot.jammed = arg1;
}
