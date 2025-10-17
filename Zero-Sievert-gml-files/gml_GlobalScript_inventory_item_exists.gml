function inventory_item_exists(arg0)
{
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.quantity > 0 && _loot.item == arg0)
        {
            db_close();
            return true;
        }
        
        _i++;
    }
    
    db_close();
    return false;
}
