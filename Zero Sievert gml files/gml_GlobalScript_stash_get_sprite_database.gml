function stash_get_sprite_database(arg0)
{
    var _sprite = global.stash_sprite_database[arg0].sprite;
    
    if (is_undefined(_sprite) || !sprite_exists(_sprite))
        trace_error("Stash sprite with index", arg0, "not recognized");
    
    return _sprite;
}
