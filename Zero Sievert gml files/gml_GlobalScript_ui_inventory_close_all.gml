function ui_inventory_close_all()
{
    uiGetData().reward_item = undefined;
    uiGetData().player_got_hit = false;
    var _layer = uiOnionCurrentLayer();
    var _layer2 = uiOnionCurrent();
    
    if (!is_undefined(_layer))
    {
        var _root = uiLayerGetRoot("inventory layer");
        var _loot_ui_array = uiFindAllType(_root, "class_ui_item");
        ui_stash_close();
        ui_chest_close();
        ui_trading_close();
        var _output_loot_array = [];
        var _i = 0;
        
        repeat (array_length(_loot_ui_array))
        {
            var _loot_ui = _loot_ui_array[_i];
            var _parent = _loot_ui.Get("parent");
            
            if (is_struct(_parent) && _parent.identifier != "other inventory")
            {
                var _loot = ui_convert_element_to_loot(_loot_ui);
                array_push(_output_loot_array, _loot);
            }
            
            _i++;
        }
        
        db_open(inventory_target_db());
        db_write("Inventory", "items", _output_loot_array);
        db_close();
        player_init_load_items();
        uiOnionCurrent().LayerDelete(_layer);
        uiOnionCurrent().LayerDelete("sort menu");
        uiOnionCurrent().LayerDelete("context menu");
    }
    
    player_set_local_state(scr_player_state_move);
}
