function ui_modding_populate(arg0)
{
    var _weapon_item = loot_get_item(uiGetData().modding_loot);
    uiGetData().modding_mod_pos = arg0;
    var _loot_array;
    
    if (global.general_debug)
    {
        _loot_array = [];
        _i = 0;
        
        repeat (array_length(global.item_data_array))
        {
            var _item = global.item_data_array[_i];
            
            if (item_mod_fits_weapon(_item, _weapon_item) && item_mod_fits_position(_item, arg0))
                array_push(_loot_array, new class_loot(_item, 1));
            
            _i++;
        }
    }
    else
    {
        _loot_array = inventory_and_stash_get_mod_array(_weapon_item, arg0);
    }
    
    var _destination_struct = uiFind(uiLayerGetRoot("modding layer"), "mod inventory");
    _destination_struct.ChildrenClear();
    uiOpenExisting(_destination_struct);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        var _remove = false;
        uiOpen(class_ui_loot_modding);
        uiCurrentOpen().Set("loot", _loot);
        uiCurrentOpen().AutoPlace(_destination_struct);
        uiClose();
        _i++;
    }
    
    var _dest_struct = uiFind(uiLayerGetRoot("modding layer"), "installed mod inventory");
    _dest_struct.ChildrenClear();
    var _installed_item_id = loot_weapon_get_mod(uiGetData().modding_loot, arg0);
    
    if (_installed_item_id != "no_item")
    {
        var _installed_loot = new class_loot(_installed_item_id, 1);
        uiOpen(class_ui_loot_installed_mod);
        uiCurrentOpen().Set("loot", _installed_loot);
        uiCurrentOpen().AutoPlace(_dest_struct);
        uiClose();
    }
    
    uiClose();
    uiFind(__uiRootStackTop(), "mod position list").ReplaceFromFile("ZS_vanilla/ui/modding_exec_mod_position_list.ui");
    uiFind(__uiRootStackTop(), "mod stats").ReplaceFromFile("ZS_vanilla/ui/modding_exec_stats.ui");
}
