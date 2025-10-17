function scr_quad(arg0, arg1, arg2, arg3, arg4)
{
    var _vb = arg0;
    var _x1 = arg1;
    var _y1 = arg2;
    var _x2 = arg3;
    var _y2 = arg4;
    vertex_position_3d(_vb, _x1, _y1, 0);
    vertex_position_3d(_vb, _x1, _y1, 1);
    vertex_position_3d(_vb, _x2, _y2, 0);
    vertex_position_3d(_vb, _x1, _y1, 1);
    vertex_position_3d(_vb, _x2, _y2, 0);
    vertex_position_3d(_vb, _x2, _y2, 1);
}
