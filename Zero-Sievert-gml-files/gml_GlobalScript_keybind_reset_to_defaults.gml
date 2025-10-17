function keybind_reset_to_defaults()
{
    db_open("local settings");
    
    for (var i = 0; i < array_length(global.kb_id); i++)
    {
        global.kb_now[i] = global.kb_default[i];
        db_write("Keybinding", global.kb_name[i], global.kb_default[i]);
    }
    
    db_close();
    scr_draw_text_with_box("All controls have been reset");
}
