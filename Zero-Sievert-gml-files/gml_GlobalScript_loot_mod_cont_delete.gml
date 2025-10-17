function loot_mod_cont_delete(arg0, arg1)
{
    if (arg1 == undefined)
        exit;
    
    variable_struct_set(arg0, arg1, "no_item");
}
