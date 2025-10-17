function loot_mod_cont_clear(arg0)
{
    var _i = 0;
    
    repeat (array_length(global.mod_pos_data_array))
    {
        variable_struct_set(arg0, global.mod_pos_data_array[_i], "no_item");
        _i++;
    }
}
