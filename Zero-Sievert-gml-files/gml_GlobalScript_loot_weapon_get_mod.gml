function loot_weapon_get_mod(arg0, arg1)
{
    if (arg0 == undefined)
        return "no_item";
    
    return loot_mod_cont_get(struct_get_from_hash(arg0, variable_get_hash("mods")), arg1);
}
