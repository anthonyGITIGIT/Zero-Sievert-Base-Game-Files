function ui_trading_close()
{
    if (uiGetData().trader_target == undefined)
        exit;
    
    var _trader;
    
    with (uiGetData())
    {
        _trader = trader_target;
        trader_target = undefined;
        trader_page = trader_pages_default_alias();
    }
    
    var _root = uiLayerGetRoot("inventory layer");
    var _sell_container = uiFind(_root, "sell inventory");
    var _sell_ui_array = uiFindAllType(_sell_container, "class_ui_item");
    var _i = 0;
    
    repeat (array_length(_sell_ui_array))
    {
        ui_move_inventory_element(_sell_ui_array[_i], infinity, "player inventory");
        _i++;
    }
    
    var _loot_ui_array = uiFindAllType(_root, "class_ui_loot_trader");
    _i = 0;
    
    repeat (array_length(_loot_ui_array))
    {
        var _loot_ui = _loot_ui_array[_i];
        
        if (_loot_ui.Get("parent").identifier == "buy inventory")
        {
            var _loot = ui_convert_element_to_loot(_loot_ui);
            trader_inventory_add(_trader, _loot.item, _loot.quantity, _loot.min_level);
        }
        
        _i++;
    }
    
    db_open(inventory_target_db());
    db_write("stats", "money", global.player_money);
    db_close();
    
    with (_trader)
    {
        db_open("general");
        db_write(_trader, "items", loot_array);
        db_close();
    }
}
