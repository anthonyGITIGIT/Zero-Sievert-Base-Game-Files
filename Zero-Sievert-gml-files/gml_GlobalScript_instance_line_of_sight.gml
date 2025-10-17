function instance_line_of_sight(arg0, arg1, arg2)
{
    if (!instance_exists(arg2))
        return false;
    
    return !collision_line(arg0, arg1, arg2.x, arg2.y, obj_solid, true, true);
}
