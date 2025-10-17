function scr_draw_text_with_box(arg0, arg1 = true)
{
    with (obj_draw_something)
        instance_destroy();
    
    var _instance = instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0, obj_draw_something);
    _instance.t = arg1 ? language_get_string(arg0) : arg0;
}
