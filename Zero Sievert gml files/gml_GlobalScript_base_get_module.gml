function base_get_module(arg0)
{
    if (arg0 < 0 || arg0 >= array_length(global.sl_base_id))
    {
        trace_error("Slot index invalid (", arg0, ")");
        exit;
    }
    
    return global.sl_base_id[arg0];
}
