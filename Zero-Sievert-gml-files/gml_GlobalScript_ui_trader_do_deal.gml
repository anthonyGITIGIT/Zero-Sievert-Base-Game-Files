function ui_trader_do_deal()
{
    var _trader = uiGetData().trader_target;
    
    if (!instance_exists(_trader))
    {
        trace("Warning! Trader ", _trader, " doesn't exist");
        exit;
    }
    
    var _deal_value_struct = ui_trader_calculate_deal_value();
    
    if ((global.player_money + _deal_value_struct.net_value_for_player) < 0)
    {
        scr_draw_text_with_box("Not enough roubles");
        return false;
    }
    
    if (is_in_hub())
    {
        if ((global.trader_money_all + _deal_value_struct.net_value_for_trader) < 0)
        {
            scr_draw_text_with_box("Trader does not have enough roubles");
            return false;
        }
    }
    else if ((_trader.money_trader + _deal_value_struct.net_value_for_trader) < 0)
    {
        scr_draw_text_with_box("Trader does not have enough roubles");
        return false;
    }
    
    var _root = uiLayerGetRoot("inventory layer");
    var _player_inventory = uiFind(_root, "player inventory");
    var _sell_inventory = uiFind(_root, "sell inventory");
    var _buy_inventory = uiFind(_root, "buy inventory");
    var _success = true;
    var _buy_array = _buy_inventory.__children;
    inventory_write_to_db();
    var _loot_grid = new class_loot_grid(8, 11);
    _success &= _loot_grid.PlaceFromInventoryUI(_player_inventory);
    _success &= _loot_grid.TryPlaceFromInventoryUI(_buy_inventory);
    _loot_grid.Destroy();
    
    if (!_success)
    {
        scr_draw_text_with_box("Not enough inventory space!");
        exit;
    }
    
    var _i = 0;
    
    repeat (array_length(_buy_array))
    {
        var _child = _buy_array[_i];
        ui_inventory_add_loot(_child.__lootStruct, "player inventory", class_ui_item);
        _i++;
    }
    
    stat_increment("tot_trades");
    steam_stat_increment("tradescompleted");
    var _trader_id = struct_get_from_hash(_trader, variable_get_hash("trader_id")) ?? npc_get_trader_id(_trader.npc_id);
    db_open("general");
    db_write(_trader_id, "items", _trader.loot_array);
    db_close();
    _root = uiLayerGetRoot("inventory layer");
    var _loot_ui_array = uiFindAllType(_root, "class_ui_item");
    var _output_loot_array = [];
    var _non_player_inventories = ["other inventory", "buy inventory", "sell inventory"];
    _i = 0;
    
    repeat (array_length(_loot_ui_array))
    {
        var _loot_ui = _loot_ui_array[_i];
        var _parent = _loot_ui.Get("parent");
        
        if (is_struct(_parent) && array_find_index(_non_player_inventories, _parent.identifier) == undefined)
        {
            var _loot = ui_convert_element_to_loot(_loot_ui);
            array_push(_output_loot_array, _loot);
        }
        
        _i++;
    }
    
    db_open(inventory_target_db());
    db_write("Inventory", "items", _output_loot_array);
    db_close();
    _buy_inventory.ChildrenClear();
    _sell_inventory.ChildrenClear();
    trader_transfer_money(_trader, _deal_value_struct.player_sale_value, _deal_value_struct.trader_sale_value);
    
    if (_deal_value_struct.net_value_for_player != 0 || _deal_value_struct.net_value_for_trader != 0)
        audio_play_sound(snd_deal, 20, false);
    
    db_force_save_soft("general");
    mods_perform_event("trade_completed");
    
    if (instance_exists(obj_prologue))
    {
        if (obj_prologue.state == UnknownEnum.Value_19)
            obj_prologue.deal_done = true;
    }
    
    return true;
}

enum UnknownEnum
{
    Value_19 = 19
}
