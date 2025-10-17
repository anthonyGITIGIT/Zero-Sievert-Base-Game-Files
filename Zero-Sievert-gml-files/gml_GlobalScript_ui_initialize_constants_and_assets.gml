function ui_initialize_constants_and_assets()
{
    uiCatspeakGetEnvironment().addConstant("kb_cancel", UnknownEnum.Value_40, "MAP_forest_desc", "The first step into the wasteland", "MAP_makeshift_camp_desc", "An open area of tents, debris, and ruined vehicles", "MAP_industrial_area_desc", "Steel and concrete have become the perfect hunting ground", "MAP_swamp_desc", "Low visibility, high danger, nowhere to hide", "MAP_mall_desc", "Don't trust the quiet corridors", "MAP_city_desc", "Urban warfare at its deadliest, only the best survive here", "c_selected", 4259071, "c_aqua", 16776960, "c_black", 0, "c_blue", 16711680, "c_dkgray", 4210752, "c_dkgrey", 4210752, "c_fuchsia", 16711935, "c_grey", 8421504, "c_gray", 8421504, "c_green", 32768, "c_lime", 65280, "c_ltgray", 12632256, "c_ltgrey", 12632256, "c_maroon", 128, "c_navy", 8388608, "c_olive", 32896, "c_orange", 4235519, "c_purple", 8388736, "c_red", 255, "c_silver", 12632256, "c_teal", 8421376, "c_white", 16777215, "c_yellow", 65535, "c_accept_green", 6003559, "c_stat_green", 9688723, "c_stat_red", 5855724);
    uiCatspeakGetEnvironment().addConstant("GUI_SCALE", 4);
    uiCatspeakGetEnvironment().addConstant("s_zs_title_main_menu", s_zs_title_main_menu, "s_zs_menu_bar", s_zs_menu_bar, "s_tutorial_crosshair", s_tutorial_crosshair, "s_tutorial_enemiesandarmor", s_tutorial_enemiesandarmor, "s_hud_freccia", s_hud_freccia, "s_hud_inv", s_hud_inv, "s_hud_inv_trading", s_hud_inv_trading, "s_hud_inv_storage", s_hud_inv_storage, "s_roubles_8x8", s_roubles_8x8, "s_hud_craft_2", s_hud_craft_2, "s_hud_item_spawn", s_hud_item_spawn, "s_hud_mod", s_hud_mod, "s_hud_trader_icon", s_hud_trader_icon, "s_minimap_center", s_minimap_center, "s_hud_slider_bar_9slice_thick", s_hud_slider_bar_9slice_thick, "s_hud_slider_bar_9slice_thin", s_hud_slider_bar_9slice_thin, "s_hud_checkbox_9slice", s_hud_checkbox_9slice, "s_hud_modal_background_9slice", s_hud_modal_background_9slice, "s_hud_pda_modal_background_9slice", s_hud_pda_modal_background_9slice);
    
    for (var _index = 0; sprite_exists(_index); _index++)
        uiCatspeakGetEnvironment().addConstant(sprite_get_name(_index), _index);
}

enum UnknownEnum
{
    Value_40 = 40
}
