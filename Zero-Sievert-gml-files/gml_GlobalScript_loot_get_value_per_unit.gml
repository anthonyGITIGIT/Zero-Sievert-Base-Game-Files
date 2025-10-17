function loot_get_value_per_unit(arg0)
{
    with (arg0)
    {
        var _value = item_get_value(item);
        _value *= (loot_get_durability(arg0) / 100);
        
        if (item_weapon_get_moddable(item))
            _value += loot_mod_cont_get_value(mods);
        
        if (item == "roubles")
            _value /= difficulty_get("trade_sell_mult");
        
        return _value;
    }
}
