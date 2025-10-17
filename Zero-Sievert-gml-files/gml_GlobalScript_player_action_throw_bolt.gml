function player_action_throw_bolt()
{
    with (player_get_local())
    {
        var _dis = 4;
        var _dir = point_direction(x, y, aim_point_x, aim_point_y);
        var _xx = lengthdir_x(_dis, _dir);
        var _yy = lengthdir_y(_dis, _dir);
        var bolt = instance_create_depth(x + _xx, y + _yy, -y, obj_bolt);
        bolt.dir = _dir;
        bolt.spd = 3;
        return true;
    }
}
