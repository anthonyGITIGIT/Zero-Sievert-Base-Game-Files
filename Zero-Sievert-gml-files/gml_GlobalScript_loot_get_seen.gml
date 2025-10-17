function loot_get_seen(arg0)
{
    if (arg0 == undefined)
        return true;
    
    return struct_get_from_hash(arg0, variable_get_hash("seen")) ?? true;
}
