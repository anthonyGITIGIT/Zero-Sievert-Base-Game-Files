function ui_inventory_sort(arg0, arg1 = "player inventory")
{
    var _root = uiLayerGetRoot("inventory layer");
    var _player_inventory = uiFind(_root, arg1);
    var _buy_array = _player_inventory.__children;
    var _number_of_items = array_length(_buy_array);
    var _buy_array_new = [];
    var _buy_array_old = [];
    array_copy(_buy_array_new, 0, _buy_array, 0, _number_of_items);
    array_copy(_buy_array_old, 0, _buy_array, 0, _number_of_items);
    var _sorting_grid = ds_grid_create(3, _number_of_items);
    
    for (var i = 0; i < _number_of_items; i++)
    {
        ds_grid_set(_sorting_grid, 0, i, _buy_array_new[i]);
        ds_grid_set(_sorting_grid, 2, i, (_buy_array_new[i].__worldBottom - _buy_array_new[i].__worldTop) * (_buy_array_new[i].__worldRight - _buy_array_new[i].__worldLeft));
        
        switch (arg0)
        {
            case 0:
                ds_grid_set(_sorting_grid, 1, i, irandom(999));
                break;
            
            case 1:
                ds_grid_set(_sorting_grid, 1, i, loot_get_value(_buy_array_new[i].__lootStruct));
                break;
            
            case 2:
                ds_grid_set(_sorting_grid, 1, i, loot_get_weight(_buy_array_new[i].__lootStruct));
                break;
            
            case 3:
                ds_grid_set(_sorting_grid, 1, i, loot_get_category(_buy_array_new[i].__lootStruct) + loot_get_name(_buy_array_new[i].__lootStruct));
                break;
            
            case 4:
                ds_grid_set(_sorting_grid, 1, i, (_buy_array_new[i].__worldBottom - _buy_array_new[i].__worldTop) * (_buy_array_new[i].__worldRight - _buy_array_new[i].__worldLeft));
                break;
            
            case 5:
                ds_grid_set(_sorting_grid, 1, i, loot_get_durability(_buy_array_new[i].__lootStruct));
                break;
            
            case 6:
                ds_grid_set(_sorting_grid, 1, i, loot_get_quantity(_buy_array_new[i].__lootStruct));
                break;
            
            default:
                show_debug_message("NO ORDER");
                ds_grid_set(_sorting_grid, 1, i, irandom(999));
                break;
        }
    }
    
    ds_grid_sort(_sorting_grid, 2, false);
    ds_grid_sort(_sorting_grid, 1, false);
    
    for (var i = 0; i < _number_of_items; i++)
        _buy_array_new[i] = ds_grid_get(_sorting_grid, 0, i);
    
    ds_grid_destroy(_sorting_grid);
    _player_inventory.ChildrenClear();
    var _i = 0;
    var _enough_room = true;
    
    repeat (array_length(_buy_array_new))
    {
        var _child = _buy_array_new[_i];
        _enough_room &= ui_inventory_add_loot(_child.__lootStruct, arg1, class_ui_item, true);
        _i++;
    }
    
    _i = 0;
    
    if (!_enough_room)
    {
        _player_inventory.ChildrenClear();
        scr_draw_text_with_box("Not enough inventory space!");
        
        repeat (array_length(_buy_array_old))
        {
            var _child = _buy_array_old[_i];
            ui_inventory_add_loot(_child.__lootStruct, arg1, class_ui_item, false);
            _i++;
        }
        
        return false;
    }
    
    return true;
}
