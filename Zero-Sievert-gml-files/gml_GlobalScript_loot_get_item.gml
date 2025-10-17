function loot_get_item(arg0)
{
    if (!is_struct(arg0))
        return "no_item";
    
    return arg0.item;
}
