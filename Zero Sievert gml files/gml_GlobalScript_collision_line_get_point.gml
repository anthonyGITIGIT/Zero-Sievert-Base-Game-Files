function collision_line_get_point(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var _collision_point = [-1, -1];
    var _check_start_x = arg0;
    var _check_start_y = arg1;
    var _check_end_x = arg2;
    var _check_end_y = arg3;
    var _iteration = 0;
    var _max_iterations = ceil(log2(point_distance(arg0, arg1, arg2, arg3) / arg5));
    
    while (_iteration < _max_iterations)
    {
        var _mid_x = (_check_start_x + _check_end_x) / 2;
        var _mid_y = (_check_start_y + _check_end_y) / 2;
        
        if (collision_line(_check_start_x, _check_start_y, _mid_x, _mid_y, arg4, false, true))
        {
            _check_end_x = _mid_x;
            _check_end_y = _mid_y;
        }
        else
        {
            _check_start_x = _mid_x;
            _check_start_y = _mid_y;
        }
        
        if (point_distance(_check_start_x, _check_start_y, _check_end_x, _check_end_y) < arg5)
        {
            _collision_point[0] = _check_start_x;
            _collision_point[1] = _check_start_y;
            break;
        }
        
        _iteration++;
    }
    
    return _collision_point;
}
