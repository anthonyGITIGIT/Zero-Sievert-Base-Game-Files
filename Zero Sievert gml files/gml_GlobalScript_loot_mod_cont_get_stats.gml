function loot_mod_cont_get_stats(arg0, arg1 = undefined)
{
    if (arg1 == undefined)
        arg1 = new class_weapon_stats();
    
    if (arg0 == undefined)
        return undefined;
    
    with (arg1)
    {
        var _i = 0;
        
        repeat (array_length(global.mod_pos_data_array))
        {
            var _item = variable_struct_get(arg0, global.mod_pos_data_array[_i]);
            
            if (item_exists(_item))
            {
                recoil += item_mod_get_recoil(_item);
                ergo += item_mod_get_ergo(_item);
                acc += item_mod_get_acc(_item);
                damage += item_mod_get_damage(_item);
                reload_speed += item_mod_get_reload_speed(_item);
            }
            
            _i++;
        }
    }
    
    return arg1;
}
