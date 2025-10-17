function player_action_open_inventory()
{
    with (uiGetData())
    {
        loot_name = "Ground";
        chest_target = undefined;
        chest_using = true;
        stash_page = undefined;
        trader_target = undefined;
        trader_page = undefined;
    }
    
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/inventory_player.ui", "inventory layer");
    player_set_local_state(scr_player_state_inventory);
    ui_player_inventory_populate(true);
    audio_play_sound(snd_inventory_open, 2, false);
    return true;
}
