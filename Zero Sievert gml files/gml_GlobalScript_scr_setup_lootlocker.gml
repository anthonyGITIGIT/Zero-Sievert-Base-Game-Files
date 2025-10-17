function scr_setup_lootlocker()
{
    if (!!steam_initialised() && db_read_ext("shared settings", "Game analytics", "collect_data", false))
        trace("Init: Setting up LootLocker");
    
    instance_create_depth(0, 0, 0, LootLocker);
}
