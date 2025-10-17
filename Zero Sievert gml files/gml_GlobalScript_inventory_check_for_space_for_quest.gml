function inventory_check_for_space_for_quest(arg0, arg1 = 1)
{
    if (!is_array(arg0))
        arg0 = [arg0];
    
    var _loot_array = SnapDeepCopy(db_read_ext(inventory_target_db(), "Inventory", "items", []));
    var _loot_grid = new class_loot_grid(8, 11);
    _loot_grid.PlaceFromInventoryLootArray(_loot_array);
    var _success = true;
    var _j = 0;
    
    repeat (array_length(arg0))
    {
        var _item_data = arg0[_j];
        var _item_id = _item_data.item;
        var _item_quantity = _item_data.amount;
        _item_quantity = clamp(ceil(_item_quantity * arg1), 1, 999);
        var _stack_max = item_get_stack_max(_item_id);
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            
            if (_loot.item == _item_id)
            {
                var _amount_to_add = max(0, min(_stack_max - _loot.quantity, _item_quantity));
                _item_quantity -= _amount_to_add;
                
                if (_item_quantity <= 0)
                    break;
            }
            
            _i++;
        }
        
        while (_item_quantity > 0)
        {
            _item_quantity -= min(_stack_max, _item_quantity);
            var _position = _loot_grid.TryPlace(_item_id);
            
            if (is_struct(_position))
            {
                var _loot = new class_loot(_item_id, _item_quantity, 16 * _position.x, 16 * _position.y, 0, "player inventory");
                _loot_grid.Place(_position.x, _position.y, _loot);
            }
            else
            {
                _success = false;
                break;
            }
        }
        
        _j++;
    }
    
    _loot_grid.Destroy();
    return _success;
}
