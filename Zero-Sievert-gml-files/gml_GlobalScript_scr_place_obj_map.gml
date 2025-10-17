function scr_place_obj_map(arg0, arg1, arg2)
{
    var decor_id_ = arg0;
    var startx = arg1;
    var starty = arg2;
    var o = obj_map_generator;
    
    if (room == r_hub)
        o = obj_controller;
    
    var placey = starty;
    var placex = startx;
    var decor_ = instance_create_depth(placex, placey, 0, o.decor_obj[decor_id_]);
    decor_.decor_id = decor_id_;
    decor_.need_to_check = false;
}
