function stash_get_name(arg0)
{
    var _name = "";
    _name = global.stash_sprite_database[arg0].name;
    
    if (is_undefined(_name) || !is_string(_name))
        trace_error("Stash name with index", arg0, "not recognized");
    
    return _name;
}
