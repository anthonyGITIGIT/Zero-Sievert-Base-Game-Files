if (!instance_exists(obj_controller))
    exit;

if (!instance_exists(follow_id))
{
    instance_destroy();
    exit;
}

sprite_index = item_get_sprite_ingame(follow_id.arma_now);
image_yscale = 0.4;
off_k = 4 / item_weapon_get_rate_of_fire(follow_id.arma_now);
off_k = clamp(off_k, 0.5, 10);
off_angle -= off_k;
off_angle = clamp(off_angle, 0, 5);
var _weapon_dir = (follow_id.weapon_pointing_direction + 3600) % 360;

if (_weapon_dir >= 90 && _weapon_dir <= 270)
{
    var rot = follow_id.weapon_pointing_direction + 180;
    image_xscale = -0.4;
    image_angle = rot - off_angle;
    depth = follow_id.depth + 3;
}
else
{
    var rot = follow_id.weapon_pointing_direction;
    image_xscale = 0.4;
    image_angle = rot + off_angle;
    depth = follow_id.depth - 3;
}

off_k = 2 / item_weapon_get_rate_of_fire(follow_id.arma_now);
off_k = clamp(off_k, 0.25, 10);
off_amount -= off_k;
off_amount = clamp(off_amount, 0, 3);
x = follow_id.x - lengthdir_x(off_amount, off_dir);
y = follow_id.y + 5 + lengthdir_y(off_amount, off_dir);
