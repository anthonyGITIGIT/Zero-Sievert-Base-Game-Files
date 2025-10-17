function inventory_check_for_space(arg0, arg1 = 1)
{
    var _loot_array = SnapDeepCopy(db_read_ext(inventory_target_db(), "Inventory", "items", []));
    var _loot_grid = new class_loot_grid(8, 11);
    _loot_grid.PlaceFromInventoryLootArray(_loot_array);
    var _success = true;
    var _stack_max = item_get_stack_max(arg0);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.item == arg0)
        {
            var _amount_to_add = max(0, min(_stack_max - _loot.quantity, arg1));
            arg1 -= _amount_to_add;
            
            if (arg1 <= 0)
                break;
        }
        
        _i++;
    }
    
    while (arg1 > 0)
    {
        arg1 -= min(_stack_max, arg1);
        var _position = _loot_grid.TryPlace(arg0);
        
        if (is_struct(_position))
        {
            var _loot = new class_loot(arg0, arg1, 16 * _position.x, 16 * _position.y, 0, "player inventory");
            _loot_grid.Place(_position.x, _position.y, _loot);
        }
        else
        {
            _success = false;
            break;
        }
    }
    
    _loot_grid.Destroy();
    return _success;
}
