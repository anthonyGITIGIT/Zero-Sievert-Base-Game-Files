function game_unpause()
{
    with (obj_main_menu)
    {
        audio_resume_all();
        instance_activate_region(x - 480, y - 270, 960, 540, true);
        
        if (is_in_hub())
            instance_activate_all();
        
        obj_controller.can_pause = false;
        instance_destroy();
    }
    
    move_cursor_room_with_reset(obj_cursor.cursor_before_pause_x, obj_cursor.cursor_before_pause_y);
}
