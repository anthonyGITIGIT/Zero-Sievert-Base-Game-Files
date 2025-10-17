function loot_draw_in_area(arg0, arg1, arg2, arg3, arg4, arg5 = undefined, arg6 = 16777215, arg7 = 1)
{
    if (!is_struct(arg0))
        exit;
    
    with (arg0)
    {
        var _rotation = arg5 ?? arg0.rotation;
        var _x = 0;
        var _y = 0;
        var _sprite = item_get_sprite_inv(item);
        var _original_width = sprite_get_width(_sprite);
        var _original_height = sprite_get_height(_sprite);
        var _temp_scale_h = arg3 / _original_width;
        var _temp_scale_v = arg4 / _original_height;
        var _use_scale = min(_temp_scale_h, _temp_scale_v);
        
        if (_rotation == 90)
            _y += (_use_scale * sprite_get_width(_sprite));
        
        _x += arg1;
        _y += arg2;
        
        if (item_weapon_get_moddable(item))
        {
            var _surface = surface_cache_fetch_weapon(item, mods, false);
            draw_surface_ext(_surface, _x, _y, _use_scale, _use_scale, _rotation, c_white, arg7);
        }
        else
        {
            draw_sprite_ext(_sprite, 0, _x, _y, _use_scale, _use_scale, _rotation, arg6, arg7);
        }
    }
}
