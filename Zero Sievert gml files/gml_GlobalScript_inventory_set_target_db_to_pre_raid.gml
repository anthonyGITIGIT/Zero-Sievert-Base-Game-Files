function inventory_set_target_db_to_pre_raid()
{
    __db_trace("Setting target database for inventory to \"pre_raid\"");
    global.database_target_db_for_inventory = "pre_raid";
    db_set_save_on_close("shared", true);
}
