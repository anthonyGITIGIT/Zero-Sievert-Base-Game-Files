function loot_mod_cont_copy_from_default(arg0, arg1)
{
    var _i = 0;
    
    repeat (array_length(global.mod_pos_data_array))
    {
        var _mod_pos = global.mod_pos_data_array[_i];
        variable_struct_set(arg0, _mod_pos, item_weapon_pos_get_default_id(arg1, _mod_pos));
        _i++;
    }
}
