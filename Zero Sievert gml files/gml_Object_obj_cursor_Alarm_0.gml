if (mouse_x == 0 && mouse_y == 0)
{
    alarm[0] = 1;
    exit;
}

x = mouse_x;
y = mouse_y;
active = true;
window_mouse_set(window_get_width() / 2, window_get_height() / 2);
