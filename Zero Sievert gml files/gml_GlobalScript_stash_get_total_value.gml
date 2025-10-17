function stash_get_total_value()
{
    var _value = 0;
    var _c = 0;
    
    repeat (global.storage_slot_unlocked)
    {
        var _loot_array = db_read_ext("chest", "chest" + string(_c), "items", []);
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            _value += loot_get_value(_loot_array[_i]);
            _i++;
        }
        
        _c++;
    }
    
    return _value;
}
