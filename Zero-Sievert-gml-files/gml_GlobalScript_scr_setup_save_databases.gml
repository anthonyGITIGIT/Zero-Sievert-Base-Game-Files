function scr_setup_save_databases()
{
    db_create("shared", true, true, true, false, true);
    db_create("shared settings", false, true, true, true, true);
    db_create("local settings", false, true, true, true, false);
    db_create("tutorial", false, false, false, false, false);
    db_create("all loot", false, false, false, false, false);
    db_create("raid", false, false, false, false, false);
    db_create("ftue", false, false, false, false, false);
    db_group_setup("shared", ["general", "pre_raid", "chest", "ftue"]);
    db_set_filename("local settings", "settings.json");
    db_set_filename("shared settings", "settings_shared.json");
    db_set_filename("tutorial", "tutorial.dat");
    db_set_filename("all loot", "all_loot.dat");
}
