function npc_get_grenade_amount(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var grenade_amount = struct_get_from_hash(_struct, variable_get_hash("grenade_amount"));
    
    if (grenade_amount == undefined)
        trace_error("NPC \"", arg0, "\" has no .grenade_amount data");
    
    grenade_amount = npc_get_general(arg0, grenade_amount, "grenade_amount");
    
    if (is_array(grenade_amount))
        return grenade_amount[irandom(array_length(grenade_amount) - 1)];
    
    return grenade_amount;
}
