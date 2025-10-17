function craft_required_skill_name()
{
    var _loot = uiGetData().crafting_loot;
    
    if (_loot == undefined)
        return undefined;
    
    var _skill = struct_get_from_hash(_loot, variable_get_hash("crafting_skill_id")) ?? -1;
    
    if (_skill < 0)
        return undefined;
    
    return skill_get_name(_skill);
}
