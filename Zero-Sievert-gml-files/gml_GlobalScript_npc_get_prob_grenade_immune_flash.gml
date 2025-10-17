function npc_get_prob_grenade_immune_flash(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("prob_grenade_immune_flash"));
    
    if (_value == undefined)
        trace_error("NPC \"", arg0, "\" has no .prob_grenade_immune_flash data");
    
    _value = npc_get_general(arg0, _value, "prob_grenade_immune_flash");
    return _value;
}
