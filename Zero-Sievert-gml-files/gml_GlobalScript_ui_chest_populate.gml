function ui_chest_populate(arg0)
{
    if (!player_exists_local())
        exit;
    
    with (uiGetData())
    {
        loot_name = language_get_string_iterative(arg0.name_chest ?? chest_get_name(arg0.tipo));
        chest_target = arg0;
        chest_using = true;
    }
    
    var _loot_array = db_read_ext("all loot", "chest_" + string(arg0.id), "items", []);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _item_id = loot_get_item(_loot_array[_i]);
        
        if (item_fits_category(_item_id, "weapon") || item_fits_category(_item_id, "armor"))
            _loot_array[_i].seen = true;
        
        var _ui = ui_convert_loot_to_element(_loot_array[_i], class_ui_item, "other inventory");
        
        if (_i == 0 && _ui != undefined)
            _ui.identifier = "item_to_focus";
        
        _i++;
    }
}
