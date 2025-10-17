function base_module_get_sprite(arg0)
{
    if (arg0 < 0 || arg0 >= array_length(global.base_sprite))
    {
        trace_error("Module ID invalid (", arg0, ")");
        exit;
    }
    
    return global.base_sprite[arg0];
}
