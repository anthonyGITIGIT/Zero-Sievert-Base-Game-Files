function loot_mod_cont_exists(arg0, arg1)
{
    if (!is_struct(arg0))
        return false;
    
    if (arg1 == undefined)
        return false;
    
    return item_exists(variable_struct_get(arg0, arg1));
}
