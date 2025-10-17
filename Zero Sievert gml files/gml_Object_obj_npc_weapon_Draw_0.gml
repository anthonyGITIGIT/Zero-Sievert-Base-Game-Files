if (!instance_exists(follow_id))
    exit;

if (!follow_id.draw_weapon)
    exit;

image_alpha = follow_id.image_alpha;

if (!item_weapon_get_moddable(follow_id.arma_now))
{
    var _sprite = item_get_sprite_ingame(follow_id.arma_now);
    outline_start(2, 0, _sprite);
    draw_sprite_ext(_sprite, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    outline_end();
}
else
{
    var ox = sprite_get_xoffset(item_get_sprite_ingame(follow_id.arma_now));
    var oy = sprite_get_yoffset(item_get_sprite_ingame(follow_id.arma_now));
    var rx, ry;
    
    if (image_xscale < 0)
    {
        rx = (lengthdir_x(ox, image_angle) + lengthdir_y(oy, image_angle)) * 0.4;
        ry = (lengthdir_y(ox, image_angle) - lengthdir_x(oy, image_angle)) * 0.4;
    }
    else
    {
        rx = (lengthdir_x(-ox, image_angle) - lengthdir_y(-oy, image_angle)) * 0.4;
        ry = (lengthdir_y(-ox, image_angle) + lengthdir_x(-oy, image_angle)) * 0.4;
    }
    
    var _surface = surface_cache_fetch_weapon(follow_id.arma_now, follow_id.mod_container, true);
    draw_surface_ext(_surface, x + rx, y + ry, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}
