scr_save_exp();

if (!global.general_debug)
    exit;

var _buffer = buffer_create(8, buffer_grow, 1);
var _text = "";
var _keys = variable_struct_get_names(global.language_tracking);

for (var i = 0; i < array_length(_keys); i++)
{
    if (string_pos("_", string(_keys[i])) != 1)
        _text = _text + string(string_replace_all(_keys[i], "\n", "\\n")) + "\n";
}

buffer_write(_buffer, buffer_text, _text);
buffer_save(_buffer, "Missing_Translations.txt");
buffer_delete(_buffer);
