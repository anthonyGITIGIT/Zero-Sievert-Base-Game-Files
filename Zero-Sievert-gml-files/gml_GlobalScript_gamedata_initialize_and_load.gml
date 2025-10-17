function gamedata_initialize_and_load()
{
    gamedata_clear();
    gamedata_load("gamedata_order.json");
    gamedata_build_all_weapon_array();
    gamedata_build_possible_mod_dictionary();
    gamedata_fill_out_debug_spawner();
    gamedata_setup_chests();
    gamedata_build_caliber_lookup();
    gamedata_build_languages();
    stat_reset_all_values();
    variable_struct_remove(global.weather_data.map, "id");
    variable_struct_remove(global.weather_data.type, "id");
    gamedata_weather_particle_array();
}
