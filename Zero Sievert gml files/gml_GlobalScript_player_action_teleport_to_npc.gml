function player_action_teleport_to_npc()
{
    if (is_in_hub() && !instance_exists(obj_sleep_fade))
    {
        if (uiGetData().quickmove_menu_wasopen <= -5)
        {
            __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/modal_teleport.ui");
            player_set_local_state(scr_player_state_teleport);
            return true;
        }
    }
    
    return false;
}
