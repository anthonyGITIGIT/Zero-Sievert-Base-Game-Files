function item_weapon_get_modded_silenced(arg0, arg1)
{
    if (!item_weapon_get_moddable(arg0))
        return false;
    
    if (!loot_mod_cont_exists(arg1, "brake"))
        return false;
    
    return item_mod_get_type(loot_mod_cont_get(arg1, "brake")) == "silencer";
}
