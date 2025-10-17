x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);
depth = -15910;
a += (a_increase * a_factor);

if (a >= a_max)
    a_factor = -a_factor;

if (a < 0)
    instance_destroy();
