function npc_dialogue_free_equipment()
{
    var _can_get_equipment = false;
    var _money = global.player_money;
    _money += (inventory_get_total_value() * difficulty_get("trade_sell_mult"));
    _money += (stash_get_total_value() * difficulty_get("trade_sell_mult"));
    var _min_amount = 10000;
    
    if (_money <= _min_amount)
        _can_get_equipment = true;
    
    var _is_scamming = false;
    var _already_given = false;
    var _money_chest = 0;
    
    with (obj_chest_general)
    {
        if (tipo == "discard")
        {
            var _loot_array = db_read_ext("all loot", "chest_" + string(id), "items", []);
            var _i = 0;
            
            repeat (array_length(_loot_array))
            {
                _money_chest += loot_get_value(_loot_array[_i]);
                _i++;
            }
            
            _money_chest *= difficulty_get("trade_sell_mult");
        }
    }
    
    if (_can_get_equipment == true)
    {
        if ((_money + _money_chest) > _min_amount)
        {
            _can_get_equipment = false;
            _is_scamming = true;
        }
    }
    
    var _hardcore = false;
    var _equipment = difficulty_get("hardcore_lose_equipment");
    var _ammo = difficulty_get("hardcore_lose_ammo");
    var _med = difficulty_get("hardcore_lose_medication");
    var _consumable = difficulty_get("hardcore_lose_consumable");
    
    if ((_equipment + _med + _consumable) > 0)
        _hardcore = true;
    
    if (global.can_get_free_equipment == false)
    {
        _can_get_equipment = false;
        _already_given = true;
    }
    
    if (_can_get_equipment == true)
    {
        if (_equipment)
        {
            inventory_add_item("makarov", 1);
            inventory_add_item("backpack9", 1);
        }
        
        if (_equipment && _ammo)
            inventory_add_item("ammo_9x18", 75);
        
        if (_med)
        {
            inventory_add_item("bandage", 4);
            inventory_add_item("medikit_long", 2);
            inventory_add_item("pills_anti_rad", 2);
        }
        
        if (_consumable)
        {
            inventory_add_item("water_bottle_rotten", 1);
            inventory_add_item("water_bottle_rotten", 1);
            inventory_add_item("water_bottle", 1);
            inventory_add_item("tushonka_meat", 1);
            inventory_add_item("tushonka_meat", 1);
            inventory_add_item("bread", 1);
        }
        
        global.can_get_free_equipment = false;
        db_open("general");
        db_write("Can get free equipment", "value", global.can_get_free_equipment);
        db_close();
    }
    
    if (_can_get_equipment == true && _hardcore == true && _is_scamming == false && _already_given == false)
    {
        uiOnionCurrent().LayerDelete(uiOnionCurrentLayer());
        player_set_local_state(scr_player_state_move);
        scr_draw_npc_text(obj_tradr_bar, UnknownEnum.Value_162);
    }
    
    if (_can_get_equipment == false && _hardcore == true && _is_scamming == false && _already_given == false)
    {
        uiOnionCurrent().LayerDelete(uiOnionCurrentLayer());
        player_set_local_state(scr_player_state_move);
        scr_draw_npc_text(obj_tradr_bar, UnknownEnum.Value_160);
    }
    
    if (_can_get_equipment == false && _hardcore == true && _is_scamming == true && _already_given == false)
    {
        uiOnionCurrent().LayerDelete(uiOnionCurrentLayer());
        player_set_local_state(scr_player_state_move);
        scr_draw_npc_text(obj_tradr_bar, UnknownEnum.Value_163);
    }
    
    if (_can_get_equipment == false && _hardcore == true && _already_given == true)
    {
        uiOnionCurrent().LayerDelete(uiOnionCurrentLayer());
        player_set_local_state(scr_player_state_move);
        scr_draw_npc_text(obj_tradr_bar, UnknownEnum.Value_165);
    }
    
    if (_hardcore == false)
        scr_draw_text_with_box("You can only receive equipment by activating hardcore difficulty options");
}

enum UnknownEnum
{
    Value_160 = 160,
    Value_162 = 162,
    Value_163,
    Value_165 = 165
}
