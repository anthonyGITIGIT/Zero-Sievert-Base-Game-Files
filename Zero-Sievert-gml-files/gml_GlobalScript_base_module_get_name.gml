function base_module_get_name(arg0)
{
    if (arg0 < 0 || arg0 >= array_length(global.base_name))
    {
        trace_error("Module ID invalid (", arg0, ")");
        exit;
    }
    
    return language_get_string(global.base_name[arg0]);
}
