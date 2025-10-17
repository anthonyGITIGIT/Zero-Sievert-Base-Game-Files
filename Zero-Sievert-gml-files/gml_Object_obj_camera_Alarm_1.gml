player_follow_local();

if (player_exists_local())
{
    obj_mouse.x = x;
    obj_mouse.y = y;
}

camera_set_view_pos(view_camera[0], x - 240, y - 135);
