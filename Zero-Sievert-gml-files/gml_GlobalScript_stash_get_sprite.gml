function stash_get_sprite(arg0)
{
    var _database_index = global.stash_sprite[arg0];
    var _sprite = global.stash_sprite_database[_database_index].sprite;
    
    if (is_undefined(_sprite) || !sprite_exists(_sprite))
        trace_error("Stash sprite with index", _database_index, "not recognized");
    
    return _sprite;
}
