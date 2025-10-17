function npc_get_armor(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _armor = struct_get_from_hash(_struct, variable_get_hash("armor"));
    
    if (_armor == undefined)
        trace_error("NPC \"", arg0, "\" has no .armor data");
    
    _armor = npc_get_general(arg0, _armor, "armor");
    
    if (is_array(_armor))
        return _armor[irandom(array_length(_armor) - 1)];
    
    return _armor;
}
