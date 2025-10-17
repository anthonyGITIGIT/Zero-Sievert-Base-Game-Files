function player_loadout_exists(arg0, arg1)
{
    return item_exists(player_loadout_get_item(arg0, arg1));
}
