var _pos_number = instance_get_unique_number(id);
use_left = display_padding_h;
use_top = display_padding_v + (_pos_number * (display_height + (display_padding_v / 2)));
var _left = use_left;
var _top = use_top;
gui_hover = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _left, _top, _left + display_width, _top + display_height);

if (gui_hover && mouse_check_button_released(mb_left))
{
    if (mod_status == 2 || error == true)
    {
        instance_destroy();
        mouse_clear(mb_left);
    }
}

visible = room == r_menu;
