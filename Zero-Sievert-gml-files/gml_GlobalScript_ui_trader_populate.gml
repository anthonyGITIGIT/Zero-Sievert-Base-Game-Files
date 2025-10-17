function ui_trader_populate(arg0, arg1)
{
    with (uiGetData())
    {
        loot_name = trader_pages_get_title(arg1);
        trader_target = arg0;
        trader_page = arg1;
    }
    
    uiFind(uiLayerGetRoot("inventory layer"), "other inventory").ChildrenClear();
    var _loot_array = arg0.loot_array;
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.page == arg1)
            ui_convert_loot_to_element(_loot, class_ui_loot_trader, "other inventory");
        
        _i++;
    }
}
