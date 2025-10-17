function craft_required_module_name()
{
    var _loot = uiGetData().crafting_loot;
    
    if (_loot == undefined)
        return undefined;
    
    var _module = struct_get_from_hash(_loot, variable_get_hash("crafting_module_id")) ?? 0;
    
    if (_module < 0)
        return undefined;
    
    return language_get_string(global.base_name[_module]);
}
