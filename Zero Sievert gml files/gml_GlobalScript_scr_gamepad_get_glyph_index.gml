function scr_gamepad_get_glyph_index()
{
    steam_input_run_frame();
    obj_gamepad.steam_gamepad_ids = steam_input_get_connected_controllers();
    
    if (is_undefined(obj_gamepad.steam_gamepad_ids))
        return 0;
    
    var _gamepad_count = array_length(obj_gamepad.steam_gamepad_ids);
    
    if (_gamepad_count <= 0)
        return 0;
    
    var _gamepad_to_lookup = obj_gamepad.steam_gamepad_ids[_gamepad_count - 1];
    var _input_type = steam_input_get_input_type_for_handle(_gamepad_to_lookup);
    global.is_steamdeck = _input_type == 14;
    
    switch (_input_type)
    {
        case 2:
        case 3:
        case 4:
            return 0;
        
        case 12:
        case 5:
        case 13:
            return 1;
        
        case 8:
        case 9:
        case 10:
            return 2;
        
        case 6:
        case 7:
        case 11:
        case 1:
        case 14:
        default:
            return 0;
    }
    
    return 0;
}
