function loot_mod_cont_get_value(arg0)
{
    var _value = 0;
    var _i = 0;
    
    repeat (array_length(global.mod_pos_data_array))
    {
        var _item = variable_struct_get(arg0, global.mod_pos_data_array[_i]);
        
        if (item_exists(_item))
            _value += item_get_value(_item);
        
        _i++;
    }
    
    return _value;
}
