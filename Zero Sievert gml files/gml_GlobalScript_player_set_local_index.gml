function player_set_local_index(arg0)
{
    __mp_trace("Set local player to index ", arg0);
    global.mp_state.local_player = arg0;
}
