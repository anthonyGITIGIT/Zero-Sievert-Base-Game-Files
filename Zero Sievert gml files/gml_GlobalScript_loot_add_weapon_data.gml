function loot_add_weapon_data(arg0, arg1 = item_weapon_get_ammo(arg0.item), arg2 = 0, arg3 = item_weapon_get_fire_mode(item), arg4 = undefined, arg5 = false)
{
    if (!is_string(arg1))
        trace_error("Ammo ID must be a string (datatype=", typeof(arg1), ", value=", arg1, ")");
    
    if (!is_numeric(arg2))
        trace_error("Ammo quantity must be a number (datatype=", typeof(arg2), ", value=", arg2, ")");
    
    with (arg0)
    {
        ammo_id = arg1;
        ammo_quantity = arg2;
        weapon_fire_mode = arg3;
        jammed = arg5;
        
        if (arg4 == undefined)
        {
            arg4 = loot_mod_cont_create();
            loot_mod_cont_copy_from_default(arg4, arg0.item);
        }
        
        mods = arg4;
    }
}
