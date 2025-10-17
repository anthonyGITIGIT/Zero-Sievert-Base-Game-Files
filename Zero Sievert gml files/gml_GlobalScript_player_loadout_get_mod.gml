function player_loadout_get_mod(arg0, arg1, arg2)
{
    if (arg0.object_index != obj_player && arg0.object_index != obj_player_puppet)
        trace_error("Cannot read loadout from non-player (", object_get_name(arg0.object_index), ")");
    
    return loot_mod_cont_get(player_loadout_get_mod_container(arg0, arg1), arg2);
}
