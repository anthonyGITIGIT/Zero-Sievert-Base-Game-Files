function scr_player_state_dummy()
{
    hspd = 0;
    vspd = 0;
    sprite_index = sprite_idle;
    image_speed = 0.25;
    player_reset_interactable();
    player_collect_interactable_end_game();
    player_action_interactable_scroll();
    
    if (global.kb_pressed[UnknownEnum.Value_6])
        player_action_interact();
    
    if (quest_is_complete("revelations"))
    {
        if (keyboard_check_pressed(ord("S")))
            global.end_game_text += "S";
        
        if (keyboard_check_pressed(ord("T")))
            global.end_game_text += "T";
        
        if (keyboard_check_pressed(ord("A")))
            global.end_game_text += "A";
        
        if (keyboard_check_pressed(ord("L")))
            global.end_game_text += "L";
        
        if (keyboard_check_pressed(ord("K")))
            global.end_game_text += "K";
        
        if (keyboard_check_pressed(ord("E")))
            global.end_game_text += "E";
        
        if (keyboard_check_pressed(ord("R")))
            global.end_game_text += "R";
        
        if (string_pos("STALKER", global.end_game_text) && global.end_game_good_done == false)
        {
            global.end_game_good_done = true;
            global.end_game_choice = UnknownEnum.Value_37;
            end_game_save_choice();
            scr_draw_npc_text(obj_quest_end_game, UnknownEnum.Value_257);
            end_game_delete_choices();
        }
    }
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_37 = 37,
    Value_257 = 257
}
