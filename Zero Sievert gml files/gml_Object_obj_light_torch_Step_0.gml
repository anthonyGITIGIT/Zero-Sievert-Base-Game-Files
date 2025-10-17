event_inherited();

if (instance_exists(follow_id))
{
    x = follow_id.x;
    y = follow_id.y;
    
    if (instance_exists(follow_id) && follow_id.mp_index == player_get_local_index())
        light_direction = point_direction(x, y, obj_cursor.aa_x, obj_cursor.aa_y);
    else
        light_direction = follow_id.weapon_pointing_direction;
}
