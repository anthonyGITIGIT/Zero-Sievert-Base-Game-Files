function scr_player_talk_document()
{
    var camx = camera_get_view_x(view_camera[0]);
    var camy = camera_get_view_y(view_camera[0]);
    
    if (mouse_check_button_pressed(mb_left))
    {
        if (scr_mouse_inside(camx + 24, camy + 72, 96, 12))
            player_set_local_state(scr_player_state_talk);
        
        if (instance_exists(global.speaker_nearest))
        {
            var speaker_id_ = global.speaker_nearest.speaker_id;
            
            if (global.ho_documenti == true)
            {
                if (speaker_id_ == "leader_faction1" || speaker_id_ == "leader_faction2")
                {
                    if (scr_mouse_inside(camx + 24, camy + 72 + 12, 96, 12))
                    {
                        var reputation_gain = 0;
                        db_open(inventory_target_db());
                        var _loot_array = db_read("Inventory", "items", []);
                        var _i = 0;
                        
                        repeat (array_length(_loot_array))
                        {
                            var _item = _loot_array[_i].item;
                            
                            if (item_fits_category(_item, "documents"))
                                reputation_gain += item_document_get_reputation(_item);
                            
                            _i++;
                        }
                        
                        db_close();
                        var _text = language_get_string("Your reputation with this faction has increased");
                        scr_draw_text_with_box(string_replace(_text, "[AMOUNT]", string(reputation_gain)), false);
                        player_set_local_state(scr_player_state_talk);
                    }
                }
            }
        }
    }
}
