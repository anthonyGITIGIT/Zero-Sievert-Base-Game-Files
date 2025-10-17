function npc_get_prob_grenade_rgd(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var prob_grenade_rgd = struct_get_from_hash(_struct, variable_get_hash("prob_grenade_rgd"));
    
    if (prob_grenade_rgd == undefined)
        trace_error("NPC \"", arg0, "\" has no .prob_grenade_rgd data");
    
    prob_grenade_rgd = npc_get_general(arg0, prob_grenade_rgd, "prob_grenade_rgd");
    return prob_grenade_rgd;
}
