function scr_aggiorna_save_slot(arg0)
{
    db_set_filename("shared", "save_shared_" + string(arg0) + ".dat");
}
