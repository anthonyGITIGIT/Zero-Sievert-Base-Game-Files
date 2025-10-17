function player_position_laser()
{
    if (item_exists(arma_now))
    {
        var sprite_weapon = item_get_sprite_ingame(arma_now);
        var off_dir = (image_xscale > 0) ? 90 : -90;
        var weapon_sprite_w = sprite_get_width(sprite_weapon) * 0.4;
        var diffx = weapon_sprite_w - (sprite_get_xoffset(sprite_weapon) * 0.4);
        var bullet_spawn_x = x + lengthdir_x(diffx, weapon_pointing_direction) + lengthdir_x(2, weapon_pointing_direction + off_dir);
        var bullet_spawn_y = y + lengthdir_y(diffx, weapon_pointing_direction) + lengthdir_y(2, weapon_pointing_direction + off_dir) + 5;
        laser_startx = bullet_spawn_x;
        laser_starty = bullet_spawn_y;
    }
    
    return true;
}
