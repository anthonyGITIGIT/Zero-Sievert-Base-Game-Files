global.stat_value = {};

function stat_reset_all_values()
{
    var _i = 0;
    
    repeat (stat_count())
    {
        variable_struct_set(global.stat_value, global.stat_data_array[_i], 0);
        _i++;
    }
}
