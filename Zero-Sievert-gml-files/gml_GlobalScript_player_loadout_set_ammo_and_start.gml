function player_loadout_set_ammo_and_start(arg0)
{
    var _caliber_now = item_weapon_get_caliber(player_get_local_var("arma_now"));
    var _ammo_item_array = variable_struct_get(global.caliber_ammo_data, _caliber_now);
    var _a_ammo_qnt = array_create(array_length(_ammo_item_array), 0);
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close();
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        var _ammo_index = array_find_index(_ammo_item_array, _loot.item);
        
        if (_ammo_index != undefined)
            _a_ammo_qnt[_ammo_index] += _loot.quantity;
        
        _i++;
    }
    
    _i = 0;
    
    repeat (array_length(_ammo_item_array))
    {
        if (arg0 == _ammo_item_array[_i] && _a_ammo_qnt[_i] > 0)
        {
            global.change_ammo_now = true;
            global.change_ammo_scelta = _i;
            
            with (player_get_local())
                player_action_change_ammo(true);
        }
        
        _i++;
    }
}
