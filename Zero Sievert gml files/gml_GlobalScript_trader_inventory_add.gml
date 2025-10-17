function trader_inventory_add(arg0, arg1, arg2, arg3)
{
    with (arg0)
    {
        var _i = 0;
        
        repeat (array_length(loot_array))
        {
            var _loot = loot_array[_i];
            
            if (_loot.item == arg1)
            {
                _loot.quantity += arg2;
                exit;
            }
            
            _i++;
        }
        
        var _loot_grid = new class_loot_grid(8, 11);
        _loot_grid.PlaceFromTraderLootArray(loot_array, item_get_trader_page(arg1), "other inventory");
        trader_inventory_add_new(arg0, arg1, arg2, arg3, _loot_grid);
        _loot_grid.Destroy();
    }
}
