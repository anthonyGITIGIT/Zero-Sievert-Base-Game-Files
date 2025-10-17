function loot_get_crafting_requirement_items(arg0)
{
    if (arg0 == undefined)
        return [];
    
    var _item_array = struct_get_from_hash(arg0, variable_get_hash("crafting_items_array"));
    var _quantity_array = struct_get_from_hash(arg0, variable_get_hash("crafting_item_quantity_array"));
    
    if (!is_array(_item_array))
        exit;
    
    if (!is_array(_quantity_array))
        exit;
    
    var _result_array = [];
    var _i = 0;
    
    repeat (array_length(_item_array))
    {
        var _item = _item_array[_i];
        var _quantity = _quantity_array[_i];
        
        if (is_string(_item) && _quantity > 0)
        {
            var _loot = new class_loot(_item, _quantity);
            array_push(_result_array, _loot);
        }
        
        _i++;
    }
    
    return _result_array;
}
