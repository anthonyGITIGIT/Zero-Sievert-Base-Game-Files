function loot_repair_get_caliber_count(arg0)
{
    return array_length(item_repair_get_caliber_array(arg0.item));
}
