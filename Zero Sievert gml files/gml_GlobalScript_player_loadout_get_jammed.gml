function player_loadout_get_jammed(arg0, arg1)
{
    if (arg0.object_index != obj_player && arg0.object_index != obj_player_puppet)
        trace_error("Cannot read loadout from non-player (", object_get_name(arg0.object_index), ")");
    
    var _loot = player_loadout_get_loot(arg0, arg1);
    return (_loot == undefined) ? false : (struct_get_from_hash(_loot, variable_get_hash("jammed")) ?? false);
}
