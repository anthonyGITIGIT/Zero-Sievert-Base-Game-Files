function string_news_cleanup(arg0)
{
    var _new_string = arg0;
    var _char_index = 1;
    var _char = "";
    var _img_pos = string_pos("{STEAM_CLAN_IMAGE}", _new_string);
    
    while (_img_pos != 0)
    {
        var _end_line_pos = string_pos("[/img]", _new_string);
        _new_string = string_delete(_new_string, _img_pos, (_end_line_pos + 6) - _img_pos);
        _img_pos = string_pos("{STEAM_CLAN_IMAGE}", _new_string);
    }
    
    while (_char_index < string_length(_new_string))
    {
        _char = string_char_at(_new_string, _char_index);
        
        switch (_char)
        {
            case "[":
                _new_string = string_delete(_new_string, _char_index, (string_pos("]", _new_string) - _char_index) + 1);
                continue;
                break;
            
            case "\r":
            case "\b":
            case "\f":
            case "\n":
                _new_string = string_delete(_new_string, _char_index, 1);
                continue;
                break;
            
            default:
                if (ord(_char) > 127)
                {
                    _new_string = string_delete(_new_string, _char_index, 1);
                    continue;
                }
                
                break;
        }
        
        _char_index++;
    }
    
    _char_index = 1;
    
    while (string_char_at(_new_string, _char_index) == " ")
        _new_string = string_delete(_new_string, _char_index, 1);
    
    return _new_string;
}
