function crafting_mode_execute(arg0, arg1)
{
    if (!variable_struct_exists(global.crafting_mode_dict, arg0))
    {
        trace_error("Crafting mode \"", arg0, "\" not recognised");
        exit;
    }
    
    return variable_struct_get(global.crafting_mode_dict, arg0).crafting_function(arg1);
}
