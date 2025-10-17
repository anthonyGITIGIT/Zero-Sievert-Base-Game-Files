function loot_get_created_by_player(arg0)
{
    if (arg0 == undefined)
        return false;
    
    return struct_get_from_hash(arg0, variable_get_hash("created_by_player")) ?? false;
}
