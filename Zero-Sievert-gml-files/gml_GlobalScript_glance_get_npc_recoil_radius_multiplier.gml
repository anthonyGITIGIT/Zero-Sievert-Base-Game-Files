function glance_get_npc_recoil_radius_multiplier(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _npc_recoil_radius_multiplier = struct_get_from_hash(_struct, variable_get_hash("npc_recoil_radius_multiplier"));
    
    if (_npc_recoil_radius_multiplier == undefined)
        trace_error("Glance type \"", arg0, "\" has no .npc_recoil_radius_multiplier data");
    
    return _npc_recoil_radius_multiplier;
}
