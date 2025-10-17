function loot_in_backpack_slot(arg0)
{
    if (!is_struct(arg0))
        return false;
    
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("placement"))))
        return false;
    else
        return arg0.placement == "backpack slot";
}
