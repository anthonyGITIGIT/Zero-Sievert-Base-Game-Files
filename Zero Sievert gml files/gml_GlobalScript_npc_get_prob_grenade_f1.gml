function npc_get_prob_grenade_f1(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var prob_grenade_f1 = struct_get_from_hash(_struct, variable_get_hash("prob_grenade_f1"));
    
    if (prob_grenade_f1 == undefined)
        trace_error("NPC \"", arg0, "\" has no .prob_grenade_f1 data");
    
    prob_grenade_f1 = npc_get_general(arg0, prob_grenade_f1, "prob_grenade_f1");
    return prob_grenade_f1;
}
