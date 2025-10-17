x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);
depth = -15910;

if (instance_exists(obj_exit_screen))
{
    stop = true;
    a -= a_k;
}

if (stop == true)
    a -= a_k;

if (a <= 0)
    instance_destroy();
