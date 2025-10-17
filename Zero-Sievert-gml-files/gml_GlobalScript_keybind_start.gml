function keybind_start(arg0)
{
    scr_draw_text_with_box("Waiting for input...");
    
    with (obj_main_menu)
    {
        keybind_active = true;
        keybind_target = arg0;
    }
}
