function player_action_open_trader(arg0)
{
    with (uiGetData())
    {
        loot_name = arg0.npc_name;
        trader_target = arg0;
        trader_page = trader_pages_default_alias();
        chest_target = undefined;
        chest_using = false;
        stash_page = undefined;
    }
    
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/inventory_trader.ui", "inventory layer");
    player_set_local_state(scr_player_state_inventory);
    ui_player_inventory_populate(false);
    ui_trader_populate(arg0, trader_pages_default_alias());
    return true;
}
