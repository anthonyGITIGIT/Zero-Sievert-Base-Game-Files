function settings_reload_and_apply()
{
    settings_determine_resolution();
    
    if (debug_mode)
        settings_set("fullscreen", false);
    
    settings_apply_all();
}
