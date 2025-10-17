vel_camera = 10;
dis_mouse_max = 1500;
camera_set_view_size(view_camera[0], 480, 270);

if (is_in_raid())
    follow = UnknownEnum.Value_0;
else
    follow = UnknownEnum.Value_1;

nofollowx = 0;
nofollowy = 0;
wl_state = UnknownEnum.Value_0;
wl_timer_avv = 0;
wl_timer_avv_max = 45;
wl_timer_look = 0;
wl_timer_look_max = 120;
wl_view_w = 96;
wl_view_h = 54;

enum UnknownEnum
{
    Value_0,
    Value_1
}
