function npc_get_prob_grenade_flash(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var prob_grenade_flash = struct_get_from_hash(_struct, variable_get_hash("prob_grenade_flash"));
    
    if (prob_grenade_flash == undefined)
        trace_error("NPC \"", arg0, "\" has no .prob_grenade_flash data");
    
    prob_grenade_flash = npc_get_general(arg0, prob_grenade_flash, "prob_grenade_flash");
    return prob_grenade_flash;
}
