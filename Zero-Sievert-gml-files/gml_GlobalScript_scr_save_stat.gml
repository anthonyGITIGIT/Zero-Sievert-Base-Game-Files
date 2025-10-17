function scr_save_stat()
{
    db_open("general");
    db_write("Statistics", "data", SnapDeepCopy(global.stat_value));
    db_close();
}
