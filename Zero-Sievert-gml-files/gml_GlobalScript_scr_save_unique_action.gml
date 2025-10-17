function scr_save_unique_action()
{
    db_open("general");
    
    for (var i = 0; i < array_length(global.az_section); i++)
        db_write("unique_action", global.az_key[i], global.az_done[i]);
    
    db_close();
}
