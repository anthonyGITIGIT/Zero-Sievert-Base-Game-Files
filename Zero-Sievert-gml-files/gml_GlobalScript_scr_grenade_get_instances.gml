function scr_grenade_get_instances(arg0)
{
    var _array_collision = [];
    var _x = x;
    var _y = y;
    
    if (instance_exists(obj_npc_parent))
    {
        with (obj_npc_parent)
        {
            if (point_distance(x, y, _x, _y) < arg0)
            {
                if (!collision_line(x, y, _x, _y, obj_solid, true, true))
                {
                    var _struct = {};
                    _struct.distance = point_distance(x, y, _x, _y);
                    _struct.id = id;
                    _struct.is_player = false;
                    array_push(_array_collision, _struct);
                }
            }
        }
    }
    
    if (instance_exists(player_get_local()))
    {
        with (player_get_local())
        {
            if (point_distance(x, y, _x, _y) < arg0)
            {
                if (!collision_line(x, y, _x, _y, obj_solid, true, true))
                {
                    var _struct = {};
                    _struct.distance = point_distance(x, y, _x, _y);
                    _struct.id = id;
                    _struct.is_player = true;
                    array_push(_array_collision, _struct);
                }
            }
        }
    }
    
    return _array_collision;
}
