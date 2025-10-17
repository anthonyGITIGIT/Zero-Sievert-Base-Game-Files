function player_action_open_stash()
{
    with (uiGetData())
    {
        loot_name = "Stash";
        chest_target = undefined;
        chest_using = false;
        stash_page = undefined;
        trader_target = undefined;
        trader_page = undefined;
    }
    
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/inventory_stash.ui", "inventory layer");
    player_set_local_state(scr_player_state_inventory);
    ui_player_inventory_populate(true);
    ui_stash_populate(0);
    return true;
}
