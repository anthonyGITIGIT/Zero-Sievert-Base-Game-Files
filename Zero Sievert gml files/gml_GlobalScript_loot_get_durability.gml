function loot_get_durability(arg0)
{
    if (arg0 == undefined)
        return 0;
    
    return struct_get_from_hash(arg0, variable_get_hash("durability")) ?? 100;
}
