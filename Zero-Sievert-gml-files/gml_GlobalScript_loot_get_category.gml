function loot_get_category(arg0)
{
    if (arg0 == undefined)
        return "none";
    
    return item_get_category(arg0.item);
}
