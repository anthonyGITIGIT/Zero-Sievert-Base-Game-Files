function scr_bullet_near()
{
    var _near_bullet_id = instance_nearest(x, y, obj_bullet_parent);
    
    if (instance_exists(_near_bullet_id))
    {
        if (point_distance(x, y, _near_bullet_id.x, _near_bullet_id.y) < 32 && _near_bullet_id.shooter_faction != faction)
        {
            var _new_target = _near_bullet_id.shooter_id;
            
            if (instance_exists(_new_target))
            {
                if (!instance_exists(target) || target_relation != UnknownEnum.Value_2)
                {
                    target = _new_target;
                    last_seen_x = _new_target.x;
                    last_seen_y = _new_target.y;
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_2 = 2
}
