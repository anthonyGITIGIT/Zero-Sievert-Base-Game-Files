function stat_import(arg0)
{
    stat_reset_all_values();
    var _i = 0;
    
    repeat (stat_count())
    {
        var _name = global.stat_data_array[_i];
        var _value = variable_struct_get(arg0, _name);
        
        if (is_numeric(_value))
            variable_struct_set(global.stat_value, _name, _value);
        
        _i++;
    }
}
