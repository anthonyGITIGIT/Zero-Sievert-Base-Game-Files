function scr_spawn_shell()
{
    var shell = instance_create_depth(x, y, -y, obj_bullet_shell);
    shell.stop_y = y + 8 + random_range(-2, 2);
    shell.image_index = item_ammo_get_shell(item_weapon_get_ammo(arma_now));
    
    if (image_xscale == 1)
    {
        shell.image_angle = weapon_pointing_direction;
        shell.direction = weapon_pointing_direction + 90 + random_range(20, 45);
    }
    else
    {
        shell.image_angle = weapon_pointing_direction;
        shell.direction = (weapon_pointing_direction - 90) + random_range(-45, -20);
    }
    
    if (object_is_player(object_index))
    {
        shell.audio_can = true;
        shell_shot_count++;
        nothingbutjunk_achievement();
    }
}
