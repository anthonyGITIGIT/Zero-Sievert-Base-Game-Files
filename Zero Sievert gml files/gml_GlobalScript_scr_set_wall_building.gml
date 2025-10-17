function scr_set_wall_building(arg0, arg1, arg2, arg3)
{
    var xx = arg0 * 16;
    var yy = arg1 * 16;
    var wall_ss = arg2;
    var cell_ = arg3;
    var ww = instance_create_depth(xx, yy, -999, obj_wall_building);
    ww.wall_building = true;
    ww.wall_s = wall_ss;
    ww.cell = cell_;
    var _solid = instance_create_depth(xx, yy, -999, obj_solid);
    _solid.my_height = 15;
}
