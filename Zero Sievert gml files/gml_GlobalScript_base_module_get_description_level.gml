function base_module_get_description_level(arg0)
{
    if (arg0 < 0 || arg0 >= array_length(global.base_des_general))
    {
        trace_error("Module ID invalid (", arg0, ")");
        exit;
    }
    
    var _lvl = base_module_get_level(arg0);
    
    if (!is_string(global.base_des[arg0][_lvl]))
    {
        trace_error("Module ID (", arg0, ") Level ", string(_lvl), " string is missing.");
        exit;
    }
    
    var _text_level = language_get_string(global.base_des[arg0][_lvl]);
    
    if (_lvl == 0)
        _text_level = language_get_string("Craft the corresponding kit to built the module");
    
    if (_lvl < global.base_lvl_max[arg0])
    {
        _text_level += ("\n\n" + language_get_string("Next Level") + ": " + string(_lvl + 1));
        _text_level += "\n";
        _text_level += language_get_string(global.base_des[arg0][_lvl + 1]);
    }
    
    return _text_level;
}
