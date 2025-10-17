function surface_cache_fetch_weapon(arg0, arg1, arg2)
{
    var _key = concat(arg0, ":", arg1, ":", arg2);
    var _surface_data = surface_cache_fetch(_key);
    var _surface = _surface_data.__surface;
    
    if (!surface_exists(_surface))
    {
        _surface = surface_create(96, 32);
        _surface_data.__surface = _surface;
        surface_set_target(_surface);
        draw_clear_alpha(c_black, 0);
        
        if (arg2)
        {
            gpu_set_fog(true, c_black, 0, 0);
            item_weapon_draw_modded(arg0, arg1, -2, 0);
            item_weapon_draw_modded(arg0, arg1, 0, -2);
            item_weapon_draw_modded(arg0, arg1, 2, 0);
            item_weapon_draw_modded(arg0, arg1, 0, 2);
            item_weapon_draw_modded(arg0, arg1, -1, -1);
            item_weapon_draw_modded(arg0, arg1, 1, -1);
            item_weapon_draw_modded(arg0, arg1, -1, 1);
            item_weapon_draw_modded(arg0, arg1, 1, 1);
            gpu_set_fog(false, c_fuchsia, 0, 0);
            item_weapon_draw_modded(arg0, arg1);
        }
        else
        {
            item_weapon_draw_modded(arg0, arg1);
        }
        
        surface_reset_target();
    }
    
    return _surface;
}
