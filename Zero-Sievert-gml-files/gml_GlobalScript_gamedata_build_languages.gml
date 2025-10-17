global.languages_last_compiled = "unknown";

function gamedata_build_languages()
{
    global.language_current = string_lower(settings_get("language"));
    
    if (global.languages_last_compiled == global.language_current)
        exit;
    
    if (!variable_struct_exists(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current))
        global.language_current = "english";
    
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
    
    font_add_enable_aa(false);
    _file = struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font"));
    var _font_sizes = struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font_sizes"));
    
    if (file_exists(_file))
    {
        for (var i = 0; i < array_length(global.language_font_scale); i++)
        {
            if (!is_undefined(global.language_fonts[i]) && font_exists(global.language_fonts[i]))
                font_delete(global.language_fonts[i]);
            
            global.language_fonts[i] = font_add(struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font")), _font_sizes[i], false, false, 32, 255);
        }
        
        global.language_font_offset_array = struct_get_from_hash(variable_struct_get(struct_get_from_hash(global.language_data, variable_get_hash("languages")), global.language_current), variable_get_hash("font_offset"));
    }
    else
    {
        show_error("Missing font: " + _file, true);
    }
    
    global.languages_last_compiled = global.language_current;
}
