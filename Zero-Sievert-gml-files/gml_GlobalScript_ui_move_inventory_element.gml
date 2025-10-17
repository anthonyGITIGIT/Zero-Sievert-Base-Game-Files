function ui_move_inventory_element(arg0, arg1, arg2, arg3 = false, arg4 = false)
{
    if (arg1 <= 0)
    {
        trace("Warning! Move quantity was less than or equal to zero (", arg1, ")");
        return false;
    }
    
    var _destination = uiFind(uiLayerGetRoot("inventory layer"), arg2);
    var _move_quantity = arg1;
    var _source_loot = arg0.__lootStruct;
    var _source_item = _source_loot.item;
    
    if (_move_quantity > _source_loot.quantity)
    {
        trace("Warning! Move quantity ", _move_quantity, " is larger than source loot quantity, reducing to ", _source_loot.quantity);
        _move_quantity = _source_loot.quantity;
    }
    
    var _destination_capacity = 0;
    var _stack_max;
    
    if (arg3)
    {
        _stack_max = infinity;
        
        with (_destination)
        {
            var _i = 0;
            
            repeat (array_length(__children))
            {
                with (__children[_i].__lootStruct)
                {
                    if (item == _source_item)
                    {
                        _destination_capacity = infinity;
                        break;
                    }
                }
                
                _i++;
            }
        }
    }
    else
    {
        _stack_max = item_get_stack_max(_source_item);
        
        with (_destination)
        {
            var _i = 0;
            
            repeat (array_length(__children))
            {
                with (__children[_i].__lootStruct)
                {
                    if (item == _source_item)
                        _destination_capacity += (_stack_max - quantity);
                }
                
                _i++;
            }
        }
    }
    
    var _empty_pos = undefined;
    
    if (_destination_capacity < _move_quantity)
    {
        _empty_pos = _destination.FindEmptyPlace(arg0);
        
        if (_empty_pos == undefined)
        {
            trace("Warning! Not enough space for new loot for \"", _source_item, "\" (quantity=", _move_quantity, ", capacity=", _destination_capacity, ")");
            
            if (arg4)
            {
                trace("Failed guarantee");
                return false;
            }
            
            _move_quantity = _destination_capacity;
        }
    }
    
    if (_move_quantity <= 0)
    {
        trace("Warning! Not enough space for ", arg1, " units of \"", _source_item, "\" (capacity=", _destination_capacity, ")");
        var _target = instance_create_depth(obj_player.x, obj_player.y, -obj_player.y, obj_chest_general);
        _target.tipo = "discard";
        var _loot = new class_loot(arg0.__lootStruct.item, arg0.__lootStruct.quantity, 0, 0, 0, "player inventory");
        loot_set_from_chest(_loot, true, arg0.__lootStruct.durability);
        var _chest_loot_array = [_loot];
        db_open("all loot");
        var _chest_name = "chest_" + string(_target.id);
        db_write(_chest_name, "chest_x", _target.x);
        db_write(_chest_name, "chest_y", _target.y);
        db_write(_chest_name, "items", _chest_loot_array);
        db_close();
        uiDestroy(arg0);
        return false;
    }
    
    var _removed = 0;
    
    with (_destination)
    {
        var _i = 0;
        
        repeat (array_length(__children))
        {
            with (__children[_i].__lootStruct)
            {
                if (item == _source_item)
                {
                    var _add = min(_move_quantity, _stack_max - quantity);
                    quantity += _add;
                    _removed += _add;
                    
                    if (_move_quantity <= 0)
                        break;
                }
            }
            
            _i++;
        }
    }
    
    _move_quantity -= _removed;
    _source_loot.quantity -= _removed;
    
    if (_move_quantity > 0)
    {
        if (_empty_pos == undefined)
        {
            trace_error("Not enough space for new loot for \"", _source_item, "\" (quantity=", arg1, ", capacity=", _destination_capacity, ", remainder=", _move_quantity, ")");
            return false;
        }
        
        if (_move_quantity < _source_loot.quantity)
        {
            var _new_loot = loot_duplicate(_source_loot);
            _new_loot.quantity = _move_quantity;
            _new_loot.placement = arg2;
            _source_loot.quantity -= _move_quantity;
            var _constructor = asset_get_index(instanceof(arg0));
            uiOpenExisting(_destination);
            uiOpen(_constructor);
            uiCurrentOpen().Set("loot", _new_loot);
            uiCurrentOpen().Set("x", _empty_pos[0]);
            uiCurrentOpen().Set("y", _empty_pos[1]);
            uiCurrentOpen().Set("rotation", _empty_pos[2]);
            uiClose();
            uiClose();
        }
        else
        {
            with (arg0)
            {
                arg0.__lootStruct.placement = arg2;
                arg0.ParentChange(_destination);
                arg0.Set("x", _empty_pos[0]);
                arg0.Set("y", _empty_pos[1]);
            }
        }
    }
    else if (_source_loot.quantity <= 0)
    {
        arg0.Destroy();
    }
    
    return true;
}
