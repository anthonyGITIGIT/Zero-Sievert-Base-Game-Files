function loot_draw(arg0, arg1, arg2, arg3 = undefined, arg4 = 4, arg5 = 16777215, arg6 = 1)
{
    if (!is_struct(arg0))
        exit;
    
    with (arg0)
    {
        var _rotation = arg3 ?? arg0.rotation;
        var _x = 0;
        var _y = 0;
        var _sprite = item_get_sprite_inv(item);
        
        if (_rotation == 90)
            _y += (arg4 * sprite_get_width(_sprite));
        
        _x += arg1;
        _y += arg2;
        
        if (item_weapon_get_moddable(item))
        {
            var _surface = surface_cache_fetch_weapon(item, mods, false);
            draw_surface_ext(_surface, _x, _y, arg4, arg4, _rotation, c_white, arg6);
        }
        else
        {
            draw_sprite_ext(_sprite, 0, _x, _y, arg4, arg4, _rotation, arg5, arg6);
        }
    }
}
