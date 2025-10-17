function loot_is_traders(arg0)
{
    if (!is_struct(arg0))
        return false;
    
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("placement"))))
        return false;
    
    if (ui_is_trading())
    {
        if (arg0.placement == "buy inventory")
            return true;
        
        if (arg0.placement == "other inventory")
            return true;
    }
    
    return false;
}
