function loot_get_value_sell_per_unit(arg0)
{
    if (room == r_menu)
    {
        return loot_get_value_per_unit(arg0) * difficulty_get("trade_sell_mult");
    }
    else
    {
        var _sell_price_multi = 1;
        
        if (skill_hunter_obtained("eyeforvalue"))
            _sell_price_multi += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("eyeforvalue")), variable_get_hash("sell_multiplier"));
        
        return loot_get_value_per_unit(arg0) * difficulty_get("trade_sell_mult") * global.sk_k[UnknownEnum.Value_21] * _sell_price_multi;
    }
}

enum UnknownEnum
{
    Value_21 = 21
}
