function craft_required_module_level()
{
    var _loot = uiGetData().crafting_loot;
    
    if (_loot == undefined)
        return undefined;
    
    return struct_get_from_hash(_loot, variable_get_hash("crafting_module_level")) ?? 0;
}
