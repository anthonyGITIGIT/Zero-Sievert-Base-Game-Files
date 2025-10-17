function inventory_add_item(arg0, arg1, arg2 = 100, arg3 = "inventory")
{
    if (!is_string(arg0))
        trace_error("Ammo ID must be a string (datatype=", typeof(arg0), ", value=", arg0, ")");
    
    if (!is_numeric(arg1))
        trace_error("Ammo quantity must be a number (datatype=", typeof(arg1), ", value=", arg1, ")");
    
    if (arg1 <= 0)
        return true;
    
    var _stack_max = item_get_stack_max(arg0);
    var _dirty = false;
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close();
    var _i = -1;
    
    for (var i = 0; i < array_length(global.__legacy_inventory_hotspots); i++)
    {
        if (global.__legacy_inventory_hotspots[i].name == arg3)
            _i = i;
    }
    
    if (_i == -1)
        arg3 = "inventory";
    
    if (arg3 == "inventory")
    {
        _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            
            if (_loot.item == arg0)
            {
                _dirty = true;
                var _amount_to_add = max(0, min(_stack_max - _loot.quantity, arg1));
                _loot.quantity += _amount_to_add;
                arg1 -= _amount_to_add;
                
                if (arg1 <= 0)
                    break;
            }
            
            _i++;
        }
        
        if (arg1 > 0)
        {
            var _loot_grid = new class_loot_grid(8, 11);
            
            while (arg1 > 0)
            {
                _loot_grid.PlaceFromInventoryLootArray(_loot_array);
                var _position = _loot_grid.TryPlace(arg0);
                
                if (is_struct(_position))
                {
                    _dirty = true;
                    var _amount_to_add = min(_stack_max, arg1);
                    arg1 -= _amount_to_add;
                    var _loot = new class_loot(arg0, _amount_to_add, _position.x * 16, _position.y * 16, _position.rot, "player inventory");
                    loot_set_from_chest(_loot, true, arg2);
                    array_push(_loot_array, _loot);
                    
                    if (__uiGlobal().__defaultOnion.LayerExists("inventory layer"))
                    {
                        var _destination_struct = uiFind(uiLayerGetRoot("inventory layer"), "player inventory");
                        uiOpenExisting(_destination_struct);
                        uiOpen(class_ui_item);
                        uiCurrentOpen().Set("loot", _loot);
                        uiClose();
                        uiClose();
                    }
                }
                else
                {
                    trace("Failed to place ", arg1, " of ", arg0);
                    var _player = player_get_local();
                    
                    if (!instance_exists(_player))
                        exit;
                    
                    var _target = instance_create_depth(_player.x, _player.y, -_player.y, obj_chest_general);
                    _target.tipo = "discard";
                    var _loot = new class_loot(arg0, arg1, 0, 0, 0, "player inventory");
                    loot_set_from_chest(_loot, true, arg2);
                    var _chest_loot_array = [_loot];
                    db_open("all loot");
                    var _chest_name = "chest_" + string(_target.id);
                    db_write(_chest_name, "chest_x", _target.x);
                    db_write(_chest_name, "chest_y", _target.y);
                    db_write(_chest_name, "items", _chest_loot_array);
                    db_close();
                    break;
                }
            }
            
            _loot_grid.Destroy();
        }
    }
    else
    {
        _i = -1;
        
        for (var i = 0; i < array_length(global.__legacy_inventory_hotspots); i++)
        {
            if (global.__legacy_inventory_hotspots[i].name == arg3)
            {
                _i = i;
                break;
            }
        }
        
        var _hotspot_data = global.__legacy_inventory_hotspots[_i];
        var _hotspot_x = _hotspot_data.x;
        var _hotspot_y = _hotspot_data.y;
        var _hotspot_w = _hotspot_data.width;
        var _hotspot_h = _hotspot_data.height;
        
        if (arg3 == "quick slot 1" || arg3 == "quick slot 2" || arg3 == "quick slot 3" || arg3 == "quick slot 4" || arg3 == "quick slot 5" || arg3 == "quick slot 6")
        {
            _hotspot_x = 0;
            _hotspot_y = 0;
        }
        
        var _position = 
        {
            x: _hotspot_x,
            y: _hotspot_y
        };
        var _loot = new class_loot(arg0, arg1, _position.x, _position.y, 0, arg3);
        loot_set_from_chest(_loot, true, arg2);
        array_push(_loot_array, _loot);
    }
    
    if (_dirty && is_in_hub())
        db_force_save_soft("pre_raid");
    
    return _dirty;
}
