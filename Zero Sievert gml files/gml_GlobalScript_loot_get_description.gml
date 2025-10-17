function loot_get_description(arg0)
{
    if (arg0 == undefined)
        return "???";
    
    return item_get_description(arg0.item);
}
