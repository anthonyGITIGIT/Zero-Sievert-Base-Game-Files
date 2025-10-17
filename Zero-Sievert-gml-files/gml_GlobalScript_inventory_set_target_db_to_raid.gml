function inventory_set_target_db_to_raid()
{
    __db_trace("Setting target database for inventory to \"raid\"");
    global.database_target_db_for_inventory = "raid";
    db_set_save_on_close("shared", false);
}
