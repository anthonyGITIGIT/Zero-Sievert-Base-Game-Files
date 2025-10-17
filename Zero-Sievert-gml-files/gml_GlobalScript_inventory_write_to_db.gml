function inventory_write_to_db()
{
    var _layer = uiOnionCurrentLayer();
    
    if (!is_undefined(_layer))
    {
        var _root = uiLayerGetRoot("inventory layer");
        var _loot_ui_array = uiFindAllType(_root, "class_ui_item");
        var _output_loot_array = [];
        var _i = 0;
        
        repeat (array_length(_loot_ui_array))
        {
            var _loot_ui = _loot_ui_array[_i];
            var _parent = _loot_ui.Get("parent");
            
            if (is_struct(_parent) && _parent.identifier != "other inventory")
            {
                var _loot2 = ui_convert_element_to_loot(_loot_ui);
                array_push(_output_loot_array, _loot2);
            }
            
            _i++;
        }
        
        db_open(inventory_target_db());
        db_write("Inventory", "items", _output_loot_array);
        db_close();
    }
}
