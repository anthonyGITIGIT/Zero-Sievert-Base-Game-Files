function player_action_talk_to_npc()
{
    uiGetData().npc_instance = global.speaker_nearest;
    
    if (instance_exists(global.speaker_nearest))
    {
        if (global.speaker_nearest.npc_speaker_id == "scientist_cristallo_viola")
            global.az_done[UnknownEnum.Value_5] = true;
    }
    
    var _root = uiFileExecute("ZS_vanilla/ui/npc.ui");
    __uiGlobal().__defaultOnion.LayerAddTop(_root, "npc");
    uiFind(_root, "left frame").ReplaceFromFile("ZS_vanilla/ui/npc_left_talk.ui");
    uiFind(_root, "right frame").ReplaceFromFile("ZS_vanilla/ui/npc_right_talk.ui");
    player_set_local_state(scr_player_state_talk);
    ftue_talking_to_npc(global.speaker_nearest);
    return true;
}

enum UnknownEnum
{
    Value_5 = 5
}
