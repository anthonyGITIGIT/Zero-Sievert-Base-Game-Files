function scr_place_obj_map_generation(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var startx = arg0;
    var starty = arg1;
    var get_sprite_ = arg2;
    var obj_ = arg3;
    var is_decor = arg4;
    var which_decor = arg5;
    get_sprite_ = object_get_sprite(obj_);
    var s_w = sprite_get_width(get_sprite_);
    var s_h = sprite_get_height(get_sprite_);
    var cx = sprite_get_xoffset(get_sprite_);
    var cy = sprite_get_yoffset(get_sprite_);
    
    if (cy != 0)
        placey = starty + cy;
    else
        placey = starty + 16;
    
    var placey = (starty + 16) - (cy - s_h);
    var placex = startx + cx;
    
    if (is_decor == false)
    {
        instance_create_depth(placex, placey, 0, obj_);
    }
    else
    {
        var decor_ = instance_create_depth(placex, placey, 0, decor_obj[which_decor]);
        decor_.decor_id = which_decor;
        decor_.need_to_check = false;
    }
}
