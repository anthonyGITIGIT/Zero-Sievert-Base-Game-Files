function npc_get_weapon(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _weapon = struct_get_from_hash(_struct, variable_get_hash("arma"));
    
    if (_weapon == undefined)
        trace_error("NPC \"", arg0, "\" has no .arma data");
    
    if (!is_array(_weapon))
        _weapon = npc_get_general(arg0, _weapon, "arma");
    
    if (is_array(_weapon))
        return _weapon[irandom(array_length(_weapon) - 1)];
    
    return _weapon;
}
