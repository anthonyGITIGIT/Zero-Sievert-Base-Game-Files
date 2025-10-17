function loot_get_value_per_unit_diff_multiplier(arg0)
{
    with (arg0)
    {
        var _value = item_get_value(item);
        var _multiplier = 1;
        
        switch (loot_get_category(arg0))
        {
            case "weapon":
                _multiplier = difficulty_get("trade_price_weapon");
                break;
            
            case "armor":
                _multiplier = difficulty_get("trade_price_armor");
                break;
            
            case "backpack":
                _multiplier = difficulty_get("trade_price_backpack");
                break;
            
            case "ammo":
                _multiplier = difficulty_get("trade_price_ammo");
                break;
            
            case "medication":
                _multiplier = difficulty_get("trade_price_medication");
                break;
        }
        
        _value *= _multiplier;
        _value *= (loot_get_durability(arg0) / 100);
        
        if (item_weapon_get_moddable(item))
            _value += loot_mod_cont_get_value(mods);
        
        return _value;
    }
}
