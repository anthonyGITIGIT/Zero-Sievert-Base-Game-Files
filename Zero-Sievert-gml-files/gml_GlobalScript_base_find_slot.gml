function base_find_slot(arg0)
{
    var _i = 0;
    
    repeat (array_length(global.sl_base_id))
    {
        if (global.sl_base_id[_i] == arg0)
            return _i;
        
        _i++;
    }
    
    return undefined;
}
