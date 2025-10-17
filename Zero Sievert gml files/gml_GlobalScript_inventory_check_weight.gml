function inventory_check_weight()
{
    with (player_get_local())
    {
        max_weight = 0;
        player_weight = 0;
        var _has_menu = __uiGlobal().__defaultOnion.HasInputReceiver();
        var _loot_array;
        
        if (_has_menu)
        {
            var _root = uiLayerGetRoot("inventory layer");
            
            if (!is_struct(_root))
                exit;
            
            _loot_array = uiFindAllType(_root, "class_ui_item");
        }
        else
        {
            _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
        }
        
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            
            if (_has_menu)
                _loot = _loot.__lootStruct;
            
            if (!loot_in_primary_weapon_slot(_loot) && !loot_in_secondary_weapon_slot(_loot))
            {
                var _loot_weight_multiplier = 1;
                
                if (skill_hunter_obtained("bigboned"))
                {
                    if (item_get_category(_loot.item) == "armor")
                    {
                        if (_loot != undefined && _loot.placement == "armor slot")
                            _loot_weight_multiplier = 1 - struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("bigboned")), variable_get_hash("weight_reduction"));
                    }
                }
                
                player_weight += (item_get_weight(_loot.item) * _loot_weight_multiplier * _loot.quantity);
            }
            
            _i++;
        }
        
        max_weight = inventory_calculate_max_weight(backpack_now);
    }
}
