function player_action_open_pda()
{
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/pda.ui", "pda layer");
    player_set_local_state(scr_player_state_pda);
    audio_play_sound(snd_ui_pda_open, 10, false);
    audio_play_sound(snd_ui_pda_open_finish, 10, false);
    return true;
}
