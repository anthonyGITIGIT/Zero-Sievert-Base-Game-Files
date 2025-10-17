function trader_inventory_subtract(arg0, arg1, arg2)
{
    with (arg0)
    {
        var _i = 0;
        
        repeat (array_length(loot_array))
        {
            var _loot = loot_array[_i];
            
            if (_loot.item == arg1)
            {
                _loot.quantity -= arg2;
                
                if (_loot.quantity <= 0)
                {
                    array_delete(loot_array, _i, 1);
                    var _ui_array = uiFindAllType(uiLayerGetRoot("inventory layer"), "class_ui_loot_trader");
                    _i = 0;
                    
                    repeat (array_length(_ui_array))
                    {
                        if (_ui_array[_i].__lootStruct == _loot)
                            uiDestroy(_ui_array[_i]);
                        else
                            _i++;
                    }
                }
                
                return true;
            }
            
            _i++;
        }
    }
    
    return false;
}
