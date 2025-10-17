function ui_trader_calculate_deal_value()
{
    var _player_sale_value = 0;
    var _trader_sale_value = 0;
    
    with (uiFindRelaxed(uiLayerGetRoot("inventory layer"), "sell inventory", true))
        _player_sale_value += GetLootValue();
    
    with (uiFindRelaxed(uiLayerGetRoot("inventory layer"), "buy inventory", true))
    {
        var _mult = 1;
        _trader_sale_value += GetLootValueDiffMultiplier();
    }
    
    var _sell_price_multi = 1;
    
    if (skill_hunter_obtained("eyeforvalue"))
        _sell_price_multi += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("eyeforvalue")), variable_get_hash("sell_multiplier"));
    
    _player_sale_value = floor(_player_sale_value * difficulty_get("trade_sell_mult") * global.sk_k[UnknownEnum.Value_21]) * _sell_price_multi;
    _trader_sale_value = floor(_trader_sale_value);
    return 
    {
        net_value_for_player: _player_sale_value - _trader_sale_value,
        net_value_for_trader: _trader_sale_value - _player_sale_value,
        player_sale_value: _player_sale_value,
        trader_sale_value: _trader_sale_value
    };
}

enum UnknownEnum
{
    Value_21 = 21
}
