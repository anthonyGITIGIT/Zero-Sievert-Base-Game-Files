function crafting_mode_get_ui_constructor(arg0)
{
    if (!variable_struct_exists(global.crafting_mode_dict, arg0))
    {
        trace_error("Crafting mode \"", arg0, "\" not recognised");
        exit;
    }
    
    return variable_struct_get(global.crafting_mode_dict, arg0).ui_constructor;
}
