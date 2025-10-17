function inventory_get_total_value()
{
    var _value = 0;
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close();
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        _value += loot_get_value(_loot_array[_i]);
        _i++;
    }
    
    return _value;
}
