function inventory_clean_up_empty_items()
{
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    var _dirty = false;
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.quantity <= 0)
        {
            _dirty = true;
            array_delete(_loot_array, _i, 1);
        }
        else
        {
            _i++;
        }
    }
    
    db_close();
    
    if (_dirty && is_in_hub())
        db_force_save_soft("pre_raid");
}
