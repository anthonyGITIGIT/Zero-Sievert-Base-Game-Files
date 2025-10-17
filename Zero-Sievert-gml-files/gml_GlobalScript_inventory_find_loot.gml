function inventory_find_loot(arg0)
{
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        if (struct_get_from_hash(array_get(_loot_array, _i), variable_get_hash("placement")) == arg0)
            return _loot_array[_i];
        
        _i++;
    }
    
    return undefined;
}
