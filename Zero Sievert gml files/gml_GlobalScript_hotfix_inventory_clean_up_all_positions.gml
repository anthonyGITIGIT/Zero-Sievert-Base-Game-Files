function hotfix_inventory_clean_up_all_positions()
{
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (variable_struct_exists(_loot, "placement"))
        {
            continue;
            _i++;
        }
        
        var _item = _loot.item;
        var _x = _loot.x;
        var _y = _loot.y;
        var _sprite = item_get_sprite_inv(_item);
        var _fixed_position = inventory_clean_up_position(_x, _y, sprite_get_width(_sprite), sprite_get_height(_sprite));
        _loot.x = _fixed_position.x;
        _loot.y = _fixed_position.y;
        _i++;
    }
}
