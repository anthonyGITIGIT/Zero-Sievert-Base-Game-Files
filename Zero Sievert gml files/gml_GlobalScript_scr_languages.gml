global.language_current = "english";
global.language_data_current = {};
global.language_tracking = {};
global.language_font_offset = 
{
    x: 0,
    y: 0
};
global.language_font_offset_array = [
{
    x: 0,
    y: 0
}];
global.language_font_scale = [8, 12, 16, 24, 32, 64];
global.language_fonts = array_create(array_length(global.language_font_scale), undefined);
global.language_fonts_references = 
{
    font_credits_32px: font_credits_32px,
    font_credits_64px: font_credits_64px,
    font_credits_big: font_credits_big,
    font_credits_small: font_credits_small,
    font_main_menu: font_main_menu,
    font_minuscolo_16px: font_minuscolo_16px,
    font_munro_12px: font_munro_12px,
    font_munro_24: font_munro_24,
    font_munro_32px: font_munro_32px,
    font_munro_64px: font_munro_64px,
    font_munro_8px: font_munro_8px,
    font_name_speaker: font_name_speaker,
    font_quest: font_quest,
    font_quest_32px: font_quest_32px
};

function language_set_new_language(arg0)
{
    var _language_previous = global.language_current;
    global.language_current = arg0;
    settings_set("language", arg0);
    settings_set_write_to_disk(true);
    var _file = struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("csv"));
    
    if (file_exists(_file))
    {
        var _grid = load_csv(struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("csv")));
        global.language_data_current = {};
        var _rows = ds_grid_height(_grid);
        
        for (var _y = 0; _y < _rows; _y++)
        {
            if (ds_grid_get(_grid, 0, _y) != "")
                variable_struct_set(global.language_data_current, string_replace_all(ds_grid_get(_grid, 0, _y), "\\n", "\n"), string_replace_all(ds_grid_get(_grid, 3, _y), "\\n", "\n"));
        }
        
        ds_grid_destroy(_grid);
    }
    else
    {
        show_error("Missing translation: " + _file, true);
        global.language_current = _language_previous;
    }
    
    font_add_enable_aa(false);
    _file = struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font"));
    var _font_sizes = struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font_sizes"));
    
    if (file_exists(_file))
    {
        for (var i = 0; i < array_length(global.language_font_scale); i++)
        {
            if (!is_undefined(global.language_fonts[i]) && font_exists(global.language_fonts[i]))
                font_delete(global.language_fonts[i]);
            
            global.language_fonts[i] = font_add(struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font")), _font_sizes[i], false, false, 32, 9467);
        }
        
        global.language_font_offset_array = struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font_offset"));
    }
    else
    {
        show_error("Missing font: " + _file, true);
    }
}

function draw_set_font_language(arg0)
{
    draw_set_font(arg0);
    
    for (var i = 0; i < array_length(global.language_font_offset_array); i++)
    {
        if (arg0 == global.language_fonts[i])
        {
            global.language_font_offset = global.language_font_offset_array[i];
            exit;
        }
    }
}

function language_resolve_font(arg0)
{
    var _font_value = arg0;
    
    if (is_string(_font_value))
    {
        _font_value = variable_struct_get(global.language_fonts_references, _font_value);
        
        if (is_undefined(_font_value))
            show_error("Missing font! " + arg0, true);
    }
    
    switch (_font_value)
    {
        case font_quest:
        case font_munro_8px:
        case font_credits_small:
            return global.language_fonts[UnknownEnum.Value_0];
            break;
        
        case font_munro_12px:
        case font_main_menu:
            return global.language_fonts[UnknownEnum.Value_2];
            break;
        
        case font_minuscolo_16px:
        case font_name_speaker:
        case font_credits_big:
            return global.language_fonts[UnknownEnum.Value_1];
            break;
        
        case font_munro_24:
        case font_death_screen:
            return global.language_fonts[UnknownEnum.Value_3];
            break;
        
        case font_credits_32px:
        case font_munro_32px:
        case font_quest_32px:
            return global.language_fonts[UnknownEnum.Value_4];
            break;
        
        case font_credits_64px:
        case font_munro_64px:
            return global.language_fonts[UnknownEnum.Value_5];
            break;
    }
}

function language_get_string(arg0 = "")
{
    if (string_replace_all(arg0, " ", "") == "")
        return arg0;
    
    if (is_undefined(variable_struct_get(global.language_data_current, arg0)))
    {
        var _uppercase_first = string_make_first_uppercase(arg0);
        
        if (!is_undefined(variable_struct_get(global.language_data_current, _uppercase_first)))
            return variable_struct_get(global.language_data_current, _uppercase_first);
        
        var _lowercase_first = string_make_first_lowercase(arg0);
        
        if (!is_undefined(variable_struct_get(global.language_data_current, _lowercase_first)))
            return variable_struct_get(global.language_data_current, _lowercase_first);
        
        if (true && !variable_struct_exists(global.language_tracking, arg0))
        {
            variable_struct_set(global.language_tracking, arg0, true);
            return arg0;
        }
        
        return arg0;
    }
    
    return variable_struct_get(global.language_data_current, arg0);
}

function language_get_string_iterative(arg0 = "")
{
    if (string_replace_all(arg0, " ", "") == "")
        return arg0;
    
    var _string = arg0;
    var _words = [];
    var _translation = language_get_string(arg0);
    
    if (_translation != arg0)
        return _translation;
    
    _string = string_replace_all(_string, "  ", " ");
    var _length = string_length(_string);
    
    for (var i = 1; i < _length; i++)
    {
        if (string_char_at(_string, i) == " ")
        {
            array_push(_words, language_get_string(string_copy(_string, 1, i - 1)));
            _string = string_delete(_string, 1, i);
            _length = string_length(_string);
            i = 1;
        }
    }
    
    array_push(_words, language_get_string(_string));
    _string = "";
    
    for (var i = 0; i < array_length(_words); i++)
        _string = _string + _words[i] + " ";
    
    if (array_length(_words) > 0)
        _string = string_delete(_string, string_length(_string), 1);
    
    return _string;
}

function language_get_font(arg0 = 1)
{
    return global.language_fonts[arg0];
}

function language_set_font(arg0 = 1)
{
    return draw_set_font_language(global.language_fonts[arg0]);
}

function language_string_width(arg0 = "", arg1 = 1)
{
    var _font = draw_get_font();
    draw_set_font_language(language_get_font(arg1));
    var _width = string_width(arg0);
    draw_set_font_language(_font);
    return _width;
}

function language_string_height(arg0 = "", arg1 = 1)
{
    var _font = draw_get_font();
    draw_set_font_language(language_get_font(arg1));
    var _width = string_height(arg0);
    draw_set_font_language(_font);
    return _width;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5
}
