function keybind_update()
{
    with (obj_main_menu)
    {
        var _key_pressed = -4;
        
        if (keyboard_check_pressed(vk_anykey))
            _key_pressed = keyboard_key;
        
        if (mouse_check_button_pressed(mb_any))
            _key_pressed = mouse_lastbutton;
        
        if (_key_pressed != -4)
        {
            var t = scr_key_map(_key_pressed);
            var valid_key = true;
            var _key_no_mouse = false;
            var already_key = false;
            
            if (t == "Error")
                valid_key = false;
            
            var _invalid_keys = [27, 8];
            
            if (array_find_index(_invalid_keys, _key_pressed) != undefined)
            {
                t = "Error";
                valid_key = false;
                keybind_active = false;
            }
            
            if (global.kb_accept_mouse[keybind_target] == false)
            {
                if (mouse_check_button_pressed(mb_any))
                {
                    valid_key = false;
                    _key_no_mouse = true;
                }
            }
            
            for (var i = 0; i < array_length_1d(global.kb_id); i++)
            {
                if (global.kb_now[i] == _key_pressed && global.kb_allowed_duplicate[i] == false)
                    already_key = true;
            }
            
            if (valid_key == true && already_key == false)
            {
                global.kb_now[keybind_target] = _key_pressed;
                scr_draw_text_with_box("Key set");
                db_open("local settings");
                db_write("Keybinding", global.kb_name[keybind_target], global.kb_now[keybind_target]);
                db_close();
                keybind_active = false;
                keybind_target = undefined;
            }
            
            if (valid_key == false)
            {
                scr_draw_text_with_box("Invalid key");
                keybind_active = false;
                keybind_target = undefined;
            }
            
            if (already_key == true)
            {
                scr_draw_text_with_box("Key already used");
                keybind_active = false;
                keybind_target = undefined;
            }
            
            if (_key_no_mouse == true)
            {
                scr_draw_text_with_box("This key doesn't accept a mouse button");
                keybind_active = false;
                keybind_target = undefined;
            }
        }
    }
}
