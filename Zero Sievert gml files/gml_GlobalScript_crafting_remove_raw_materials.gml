function crafting_remove_raw_materials(arg0)
{
    var _item_array = struct_get_from_hash(arg0, variable_get_hash("crafting_items_array"));
    var _quantity_array = struct_get_from_hash(arg0, variable_get_hash("crafting_item_quantity_array"));
    var _i = 0;
    
    repeat (array_length(_item_array))
    {
        var _item = _item_array[_i];
        var _quantity = _quantity_array[_i];
        
        if (is_string(_item) && _quantity > 0)
            inventory_and_stash_remove_item(_item, _quantity);
        
        _i++;
    }
}
