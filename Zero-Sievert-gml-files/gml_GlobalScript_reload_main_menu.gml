function reload_main_menu()
{
    audio_stop_all();
    
    with (obj_main_menu)
        stop_video = false;
    
    room_goto(r_menu);
}
