function base_reset()
{
    var _i = 0;
    
    repeat (array_length(global.base_id))
    {
        var _module_id = -1;
        var _module_free = 0;
        
        if (_i == 0)
        {
            _module_id = UnknownEnum.Value_2;
            _module_free = 2;
        }
        
        global.base_lvl[_i] = 0;
        global.sl_base_id[_i] = _module_id;
        global.sl_free[_i] = _module_free;
        _i++;
    }
}

enum UnknownEnum
{
    Value_2 = 2
}
