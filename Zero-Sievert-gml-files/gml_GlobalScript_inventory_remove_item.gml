function inventory_remove_item(arg0, arg1)
{
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close();
    var _dirty = false;
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.item == arg0)
        {
            _dirty = true;
            var _amount_to_remove = min(arg1, _loot.quantity);
            _loot.quantity -= _amount_to_remove;
            arg1 -= _amount_to_remove;
            
            if (arg1 <= 0)
                break;
        }
        
        _i++;
    }
    
    if (_dirty && is_in_hub())
        db_force_save_soft("pre_raid");
}
