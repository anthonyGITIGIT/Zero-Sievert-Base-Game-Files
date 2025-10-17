draw_set_valign(fa_top);
draw_set_halign(fa_left);
var _i = 0;
var _x = 50;
var _y = 100;
var _m = 30;
show_debug_message("start");
show_debug_message(controllers);
show_debug_message(array_length(controllers));

for (_i = 0; _i < array_length(controllers); _i++)
{
    var conhandle = controllers[_i];
    steam_input_activate_action_set(conhandle, action_sets.menu_controls);
    var _cs = "";
    _cs += (string(conhandle) + " i: " + string(_i) + " " + ", MenuSelect = " + string(steam_input_get_digital_action_data(conhandle, digital_actions.menu_select)) + " - Xbox A button in this controller -> ");
    show_debug_message(_cs);
    show_debug_message(steam_input_get_input_type_for_handle(conhandle));
    var _typestr = "not loaded";
    
    switch (steam_input_get_input_type_for_handle(conhandle))
    {
        case 1:
            _typestr = "Steam Controller";
            break;
        
        case 2:
            _typestr = "Xbox 360";
            break;
        
        case 3:
            _typestr = "Xbox One";
            break;
        
        case 4:
            _typestr = "Generic Gamepad";
            break;
        
        case 5:
            _typestr = "DualShock 4";
            break;
        
        case 6:
            _typestr = "Apple MFi";
            break;
        
        case 7:
            _typestr = "Android";
            break;
        
        case 8:
            _typestr = "Joy-Con Pair";
            break;
        
        case 9:
            _typestr = "Single Joy-Con";
            break;
        
        case 10:
            _typestr = "Pro Controller";
            break;
        
        case 11:
            _typestr = "Mobile Touch";
            break;
        
        case 12:
            _typestr = "DualShock 3";
            break;
        
        case 13:
            _typestr = "DualSense";
            break;
        
        case 14:
            _typestr = "Steam Deck";
            break;
    }
    
    show_debug_message("ANSWER:");
    show_debug_message(_typestr);
    var _menu_select_origins = steam_input_get_digital_action_origins(conhandle, action_sets.menu_controls, digital_actions.menu_select);
    var _origin = steam_input_get_action_origin_from_xbox_origin(conhandle, 0);
    var _originsprpath = steam_input_get_glyph_png_for_action_origin(_origin, 0, 0);
    var _originspr = ensureSpriteExists(_originsprpath);
    draw_text(_x, _y + (_i * _m), _cs);
    var _csw = string_width(_cs) + 1;
    draw_sprite(_originspr, 0, _x + _csw, _y + (_i * _m));
}
