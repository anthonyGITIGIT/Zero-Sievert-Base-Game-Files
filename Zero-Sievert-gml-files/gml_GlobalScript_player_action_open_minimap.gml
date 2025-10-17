function player_action_open_minimap()
{
    player_action_open_pda();
    uiGetData().pda_back_is_close = false;
    var _root = uiLayerGetRoot("pda layer");
    uiFind(_root, "pda frame").ReplaceFromFile("ZS_vanilla/ui/pda_map.ui");
    uiInputButtonConsume(_root, "map shortcut");
    return true;
}
