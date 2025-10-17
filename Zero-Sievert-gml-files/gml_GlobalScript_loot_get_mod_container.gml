function loot_get_mod_container(arg0)
{
    if (arg0 == undefined)
        return undefined;
    
    return struct_get_from_hash(arg0, variable_get_hash("mods"));
}
