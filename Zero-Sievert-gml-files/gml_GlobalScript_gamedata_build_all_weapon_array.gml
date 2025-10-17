function gamedata_build_all_weapon_array()
{
    var _i = 0;
    
    repeat (array_length(global.item_data_array))
    {
        var _item_id = global.item_data_array[_i];
        
        if (item_get_category(_item_id) == "weapon")
        {
            array_push(global.item_all_weapon_array, _item_id);
            variable_struct_set(global.item_possible_mod_data, _item_id, new class_weapon_possible_mods(_item_id));
        }
        
        _i++;
    }
}
