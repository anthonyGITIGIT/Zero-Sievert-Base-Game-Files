function inventory_get_total_of_item(arg0)
{
    var _total = 0;
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close();
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.item == arg0)
            _total += _loot.quantity;
        
        _i++;
    }
    
    return _total;
}
