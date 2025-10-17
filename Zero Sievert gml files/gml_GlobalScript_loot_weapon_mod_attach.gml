function loot_weapon_mod_attach(arg0, arg1, arg2)
{
    var _mod_container = struct_get_from_hash(arg0, variable_get_hash("mods"));
    
    if (!is_struct(_mod_container))
        return false;
    
    loot_mod_cont_set(_mod_container, arg2, arg1);
}
