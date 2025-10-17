function player_create(arg0, arg1, arg2 = 0)
{
    if (player_exists(arg2))
    {
        __mp_trace("Warning! An instance for player index ", arg2, " already exists");
        instance_destroy(player_get(arg2));
    }
    
    var _object = (arg2 == player_get_local_index()) ? obj_player : obj_player_puppet;
    __mp_trace("Creating player index ", arg2, " as ", object_get_name(_object));
    return instance_create_depth(arg0, arg1, 0, _object, 
    {
        mp_index: arg2
    });
}
