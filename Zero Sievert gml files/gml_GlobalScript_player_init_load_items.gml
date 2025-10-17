function player_init_load_items()
{
    if (!player_exists_local())
        exit;
    
    player_loadout_update();
    
    with (player_get_local())
    {
        db_open(inventory_target_db());
        var _loot_array = db_read("Inventory", "items", []);
        db_close();
        backpack_now = "no_item";
        armor_now = "no_item";
        headset_now = "no_item";
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            var _contributes_to_weight = true;
            
            switch (_loot.placement)
            {
                case "weapon slot 1":
                    _contributes_to_weight = false;
                    break;
                
                case "weapon slot 2":
                    _contributes_to_weight = false;
                    break;
                
                case "backpack slot":
                    backpack_now = _loot.item;
                    break;
                
                case "armor slot":
                    armor_now = _loot.item;
                    break;
                
                case "headset slot":
                    headset_now = _loot.item;
                    break;
            }
            
            if (_contributes_to_weight)
                player_weight += (_loot.quantity * item_get_weight(_loot.item));
            
            _i++;
        }
        
        arma_now = player_loadout_get_item(self, weapon_slot_now);
        inventory_check_weight();
    }
}
