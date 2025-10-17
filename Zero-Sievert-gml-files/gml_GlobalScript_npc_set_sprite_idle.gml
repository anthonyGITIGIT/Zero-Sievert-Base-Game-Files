function npc_set_sprite_idle(arg0, arg1)
{
    var _value = npc_get_sprite_idle(arg0);
    
    if (_value == "{use_armor}")
    {
        if (item_exists(arg1))
            return item_armor_get_s_idle(arg1);
        else
            trace_error("Armor \"", arg1, "\" doesn't exist");
    }
    
    var _sprite = is_string(_value) ? asset_get_index(_value) : _value;
    
    if (!sprite_exists(_sprite))
        trace_error("Sprite \"", _value, "\" does not exist");
    
    return _sprite;
}
