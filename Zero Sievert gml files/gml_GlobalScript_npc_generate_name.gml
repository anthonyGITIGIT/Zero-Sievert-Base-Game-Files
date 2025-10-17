function npc_generate_name(arg0)
{
    var _name = npc_get_name(arg0);
    
    if (string_pos("{", _name) > 0)
    {
        _name = string_replace_all(_name, "{bandit}", scr_generation_name(false) + " " + scr_generation_name(true));
        _name = string_replace_all(_name, "{english}", scr_generation_name_eng(false) + " " + scr_generation_name_eng(true));
        _name = string_replace_all(_name, "{Watcher}", scr_generation_name_watcher());
    }
    
    return _name;
}
