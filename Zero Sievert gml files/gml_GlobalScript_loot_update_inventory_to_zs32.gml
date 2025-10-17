function loot_array_update_to_zs32(arg0, arg1)
{
    switch (arg1)
    {
        case "player inventory":
            var _tolerance = 3;
            var _i = 0;
            
            repeat (array_length(arg0))
            {
                var _loot = arg0[_i];
                
                if (!item_exists_in_db(_loot.item))
                {
                    array_delete(arg0, _i, 1);
                }
                else
                {
                    with (_loot)
                    {
                        if (item_get_category(item) == "weapon" && !is_struct(struct_get_from_hash(self, variable_get_hash("mods"))))
                        {
                            mods = loot_mod_cont_create();
                            loot_mod_cont_copy_from_default(mods, item);
                        }
                    }
                    
                    if (variable_struct_exists(_loot, "ammo_id") && !variable_struct_exists(_loot, "jammed"))
                        _loot.jammed = false;
                    
                    if (!variable_struct_exists(_loot, "placement"))
                    {
                        var _x = _loot.x;
                        var _y = _loot.y;
                        var _found = false;
                        var _j = 0;
                        
                        repeat (array_length(global.__legacy_inventory_hotspots))
                        {
                            var _hotspot = global.__legacy_inventory_hotspots[_j];
                            var _hotspot_l = _hotspot.x;
                            var _hotspot_t = _hotspot.y;
                            var _hotspot_r = _hotspot_l + _hotspot.width;
                            var _hotspot_b = _hotspot_t + _hotspot.height;
                            
                            if (point_in_rectangle(_x, _y, _hotspot_l - _tolerance, _hotspot_t - _tolerance, _hotspot_r + _tolerance, _hotspot_b + _tolerance))
                            {
                                _found = true;
                                _loot.placement = _hotspot.name;
                                
                                if (_hotspot.type == "grid")
                                {
                                    _loot.x -= _hotspot_l;
                                    _loot.y -= _hotspot_t;
                                }
                                else
                                {
                                    _loot.x = 0;
                                    _loot.y = 0;
                                }
                                
                                break;
                            }
                            
                            _j++;
                        }
                    }
                    
                    _i++;
                }
            }
            
            break;
        
        case "player stash":
            var _i = 0;
            
            repeat (array_length(arg0))
            {
                var _loot = arg0[_i];
                
                if (!item_exists_in_db(_loot.item))
                {
                    array_delete(arg0, _i, 1);
                }
                else
                {
                    with (_loot)
                    {
                        if (item_get_category(item) == "weapon" && !is_struct(struct_get_from_hash(self, variable_get_hash("mods"))))
                        {
                            if (!is_struct(_loot.mods))
                            {
                                _loot.mods = loot_mod_cont_create();
                                loot_mod_cont_copy_from_default(_loot.mods, _loot.item);
                            }
                        }
                    }
                    
                    _i++;
                }
            }
            
            break;
        
        case "trader inventory":
            var _i = 0;
            
            repeat (array_length(arg0))
            {
                var _loot = arg0[_i];
                
                if (!item_exists_in_db(_loot.item))
                {
                    array_delete(arg0, _i, 1);
                }
                else
                {
                    with (_loot)
                    {
                        if (!is_string(struct_get_from_hash(self, variable_get_hash("page"))))
                            loot_set_from_trader(self, min_level, item_get_trader_page(item));
                        
                        if (item_get_category(item) == "weapon" && !is_struct(struct_get_from_hash(self, variable_get_hash("mods"))))
                        {
                            mods = loot_mod_cont_create();
                            loot_mod_cont_copy_from_default(mods, item);
                        }
                    }
                    
                    _i++;
                }
            }
            
            break;
    }
}
