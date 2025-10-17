function clip_to_view_edge(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    var dx = arg2 - arg0;
    var dy = arg3 - arg1;
    
    if (dx == 0)
        dx = 0.00001;
    
    if (dy == 0)
        dy = 0.00001;
    
    var tx = (dx > 0) ? (((arg4 + arg6) - arg8 - arg0) / dx) : (((arg4 + arg8) - arg0) / dx);
    var ty = (dy > 0) ? (((arg5 + arg7) - arg8 - arg1) / dy) : (((arg5 + arg8) - arg1) / dy);
    var t = min(tx, ty);
    var ix = arg0 + (dx * t);
    var iy = arg1 + (dy * t);
    return [clamp(ix, arg4 + arg8, (arg4 + arg6) - arg8), clamp(iy, arg5 + arg8, (arg5 + arg7) - arg8)];
}
