function get_kb_string(arg0, arg1 = true)
{
    var _string = "";
    
    if (arg1)
        _string += "[";
    
    _string += scr_key_map(global.kb_now[arg0]);
    
    if (arg1)
        _string += "]";
    
    return _string;
}
