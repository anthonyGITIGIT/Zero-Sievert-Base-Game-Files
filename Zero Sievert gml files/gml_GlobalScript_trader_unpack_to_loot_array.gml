function trader_unpack_to_loot_array(arg0, arg1, arg2, arg3 = [])
{
    var _loot_grid = new class_loot_grid(8, 11);
    var _multiplier = arg2 ? (global.sk_k[UnknownEnum.Value_23] * difficulty_get("trade_item_amount")) : 1;
    var _skill_multiplier = 1;
    
    if (skill_hunter_obtained("favorfromtraders"))
        _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("favorfromtraders")), variable_get_hash("trader_item_quantity_bonus"));
    
    if (arg1)
    {
        var _first_page = trader_pages_default_alias();
        var _i = 0;
        
        repeat (trader_item_get_count(arg0))
        {
            var _quantity = trader_item_get_quantity(arg0, _i);
            _quantity = ceil(_multiplier * _quantity * _skill_multiplier);
            _quantity = clamp(_quantity, 0, 999);
            
            if (_quantity > 0 && scr_chance(trader_item_get_chance(arg0, _i)))
            {
                var _item = trader_item_get_id(arg0, _i);
                var _quest = trader_item_get_quest(arg0, _i);
                
                if ((_quest != "" && quest_is_complete(_quest)) || _quest == "")
                {
                    var _position = _loot_grid.TryPlace(_item);
                    
                    if (is_struct(_position))
                    {
                        var _loot = class_loot(_item, _quantity, 16 * _position.x, 16 * _position.y, 0, "other inventory");
                        loot_set_from_trader(_loot, trader_item_get_level(arg0, _i), _first_page);
                        _loot_grid.Place(_position.x, _position.y, _loot);
                        array_push(arg3, _loot);
                    }
                }
            }
            
            _i++;
        }
    }
    else
    {
        var _page = 0;
        
        repeat (trader_pages_get_count())
        {
            var _page_alias = trader_pages_get_alias(_page);
            var _i = 0;
            
            repeat (trader_item_get_count(arg0))
            {
                var _item = trader_item_get_id(arg0, _i);
                
                if (item_get_trader_page(_item) == _page_alias)
                {
                    var _quantity = trader_item_get_quantity(arg0, _i);
                    _quantity = ceil(_quantity * global.sk_k[UnknownEnum.Value_23] * difficulty_get("trade_item_amount") * _skill_multiplier);
                    _quantity = clamp(_quantity, 0, 999);
                    
                    if (_quantity > 0 && scr_chance(trader_item_get_chance(arg0, _i)))
                    {
                        _item = trader_item_get_id(arg0, _i);
                        var _quest = trader_item_get_quest(arg0, _i);
                        
                        if ((_quest != "" && quest_is_complete(_quest)) || _quest == "")
                        {
                            var _position = _loot_grid.TryPlace(_item);
                            
                            if (is_struct(_position))
                            {
                                var _loot = new class_loot(_item, _quantity, 16 * _position.x, 16 * _position.y, 0, "other inventory");
                                loot_set_from_trader(_loot, trader_item_get_level(arg0, _i), _page_alias);
                                _loot_grid.Place(_position.x, _position.y, _loot);
                                array_push(arg3, _loot);
                            }
                        }
                    }
                }
                
                _i++;
            }
            
            _loot_grid.Clear();
            _page++;
        }
    }
    
    _loot_grid.Destroy();
    return arg3;
}

enum UnknownEnum
{
    Value_23 = 23
}
