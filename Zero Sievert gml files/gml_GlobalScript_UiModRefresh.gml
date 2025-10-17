function UiModRefresh()
{
    show_debug_message("Assert: Refresh button has been clicked.");
    mods_reload_gamedata();
    uiGetData().modding_menu_needs_refresh = false;
}
