function scr_autoclose_inventory()
{
    if (settings_get("close_inv"))
    {
        if (player_state_is(player_get_local().mp_index, scr_player_state_inventory))
            uiGetData().player_got_hit = true;
    }
    
    if (settings_get("close_pda"))
    {
        if (player_state_is(player_get_local().mp_index, scr_player_state_pda))
            uiGetData().player_got_hit = true;
    }
}
