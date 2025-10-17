function base_module_get_level(arg0)
{
    if (arg0 < 0 || arg0 >= array_length(global.base_lvl))
    {
        trace_error("Module ID invalid (", arg0, ")");
        exit;
    }
    
    return global.base_lvl[arg0];
}
