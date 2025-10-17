function debug_find_incompatible_weapon_mod()
{
    var _i = 0;
    
    repeat (array_length(global.mod_pos_data_array))
    {
        var _mod_pos = global.mod_pos_data_array[_i];
        var _installed_mod = loot_mod_cont_get(mod_container, _mod_pos);
        
        if (_installed_mod != "no_item")
        {
            if (item_mod_get_weapon_all(_installed_mod) == false)
            {
                var _array_weapon = item_mod_get_weapon_array(_installed_mod);
                var _found = false;
                
                for (var j = 0; j < array_length(_array_weapon); j++)
                {
                    if (arma_now == _array_weapon[j])
                        _found = true;
                }
                
                if (_found == false)
                {
                    show_debug_message("Generating weapon error here");
                    trace("id = ", id);
                    trace("npc_id = ", npc_id);
                    trace("arma_now = ", arma_now);
                    trace("weapon_seed = ", weapon_seed);
                    trace(SnapToJSON(mod_container.data, true, true));
                }
            }
        }
        
        _i++;
    }
}
