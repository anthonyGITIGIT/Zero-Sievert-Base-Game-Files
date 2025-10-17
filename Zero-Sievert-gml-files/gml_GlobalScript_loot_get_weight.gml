function loot_get_weight(arg0)
{
    if (arg0 == undefined)
        return "???";
    
    return item_get_weight(arg0.item, arg0);
}
