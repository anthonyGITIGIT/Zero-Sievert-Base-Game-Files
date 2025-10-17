function ui_player_inventory_populate(arg0)
{
    if (!player_exists_local())
        exit;
    
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
    var _root = uiLayerGetRoot("inventory layer");
    var _failed_array = [];
    var _ui_item_array = [];
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.quantity <= 0)
        {
            trace("Warning! Loot quantity for player inventory is 0");
        }
        else
        {
            var _placement = _loot.placement;
            
            if (_placement == "sell inventory")
                _loot.placement = "player inventory";
            
            if (_placement != "player inventory" && !arg0)
            {
                var _ui = ui_convert_loot_to_element(_loot, class_ui_item, _root.identifier);
                _ui.Set("active", false);
                _ui.Set("visible", false);
            }
            else
            {
                var _ui = ui_convert_loot_to_element(_loot, class_ui_item);
                
                if (_ui == undefined)
                {
                    array_push(_failed_array, _loot);
                    trace(["Failed items", _loot.placement]);
                }
                else
                {
                    array_push(_ui_item_array, _ui);
                }
            }
        }
        
        _i++;
    }
    
    if (array_length(_failed_array) > 0)
        trace("Failed to place at least one loot");
    
    uiFind(uiLayerGetRoot("inventory layer"), "player inventory").watch = true;
    ui_inventory_check_weight();
    var _overlap = false;
    _root = uiLayerGetRoot("inventory layer");
    var _player_inventory = uiFind(_root, "player inventory");
    var _item_array = _player_inventory.__children;
    var _box_array = [];
    
    for (_i = 0; _i < array_length(_ui_item_array); _i++)
    {
        var _x = _ui_item_array[_i].__lootStruct.x;
        var _y = _ui_item_array[_i].__lootStruct.y;
        
        if (_ui_item_array[_i].__lootStruct.placement == "player inventory")
        {
            array_push(_box_array, 
            {
                x1: _x + (_ui_item_array[_i].__localLeft / 4),
                y1: _y + (_ui_item_array[_i].__localTop / 4),
                x2: _x + (_ui_item_array[_i].__localRight / 4),
                y2: _y + (_ui_item_array[_i].__localBottom / 4),
                ui_element: _ui_item_array[_i]
            });
        }
    }
}
