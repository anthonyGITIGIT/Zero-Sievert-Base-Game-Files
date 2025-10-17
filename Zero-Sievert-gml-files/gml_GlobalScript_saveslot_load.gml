function saveslot_load(arg0)
{
    global.slot_selected = arg0;
    scr_aggiorna_save_slot(global.slot_selected);
    
    if (db_file_exists("shared"))
    {
        db_load("shared");
        
        if (db_version_newer_than("shared", 1, 2, infinity))
        {
            db_unload("shared");
            scr_draw_text_with_box("Savedata is from a newer version of the game");
        }
        else if (1 == "1" && db_version_older_than("shared", 1, 0, 0))
        {
            db_unload("shared");
            scr_draw_text_with_box("Savedata is from a legacy version of the game");
        }
        else
        {
            saveslot_reload();
            __uiGlobal().__defaultOnion.Clear();
            room_goto(r_hub);
            return true;
        }
    }
    else
    {
        scr_draw_text_with_box("No file found");
    }
    
    return false;
}
