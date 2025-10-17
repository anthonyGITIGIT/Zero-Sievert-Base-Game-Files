function loot_get_name(arg0)
{
    if (arg0 == undefined)
        return "???";
    
    return item_get_name(arg0.item);
}
