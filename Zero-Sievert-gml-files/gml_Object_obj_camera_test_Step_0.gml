cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

if (mouse_wheel_up())
{
    var new_w = cam_w - (ris_w * 10);
    var new_h = cam_h - (ris_h * 10);
    camera_set_view_size(view_camera[0], new_w, new_h);
}

if (mouse_wheel_down())
{
    var new_w = cam_w + (ris_w * 10);
    var new_h = cam_h + (ris_h * 10);
    camera_set_view_size(view_camera[0], new_w, new_h);
}

var spd = cam_w / 250;

if (global.kb_hold[UnknownEnum.Value_3])
    x -= spd;

if (global.kb_hold[UnknownEnum.Value_2])
    x += spd;

if (global.kb_hold[UnknownEnum.Value_0])
    y -= spd;

if (global.kb_hold[UnknownEnum.Value_1])
    y += spd;

camera_set_view_pos(view_camera[0], x - (cam_w / 2), y - (cam_h / 2));

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
