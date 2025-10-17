function scr_save_exp()
{
    db_open("general");
    db_write("Exp", "Amount", global.xp);
    db_write("Exp", "Livello", global.xp_level_now);
    db_close();
}
