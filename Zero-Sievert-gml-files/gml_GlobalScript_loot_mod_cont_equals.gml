function loot_mod_cont_equals(arg0, arg1)
{
    var _i = 0;
    
    repeat (array_length(global.mod_pos_data_array))
    {
        var _mod_pos = global.mod_pos_data_array[_i];
        
        if (variable_struct_get(arg0, _mod_pos) != variable_struct_get(arg1, _mod_pos))
            return false;
        
        _i++;
    }
    
    return true;
}
