function inventory_and_stash_get_total_of_item(arg0)
{
    return inventory_get_total_of_item(arg0) + stash_get_total_of_item(arg0);
}
