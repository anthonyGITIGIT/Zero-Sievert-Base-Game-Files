mouse_sensitivity = global.gamepad_data.gamepad.mouse_sensitivity_ingame;
clamp_to_window = true;
clamp_to_room = false;
clamp_to_distance = false;
clamp_to_distance_x = 500;
clamp_to_distance_y = 500;
clamp_to_distance_radius = 100;
clamp_to_box = false;
clamp_to_box_top = 400;
clamp_to_box_bottom = 600;
clamp_to_box_left = 200;
clamp_to_box_right = 800;
event_perform(ev_alarm, 0);
active = false;
mouse_x_last = 0;
mouse_y_last = 0;
follow_now = "FOLLOW_NOW_MOUSE";
follow_now_before = follow_now;
last_cursor_x = 0;
last_cursor_y = 0;

cursor_has_moved = function()
{
    if (clamp_to_distance)
    {
        if (!point_in_circle(x, y, clamp_to_distance_x, clamp_to_distance_y, clamp_to_distance_radius))
        {
            var _dir = point_direction(clamp_to_distance_x, clamp_to_distance_y, x, y);
            x = clamp_to_distance_x + lengthdir_x(clamp_to_distance_radius, _dir);
            y = clamp_to_distance_y + lengthdir_y(clamp_to_distance_radius, _dir);
        }
    }
    
    if (clamp_to_box)
    {
        x = clamp(x, clamp_to_box_left, clamp_to_box_right);
        y = clamp(y, clamp_to_box_top, clamp_to_box_bottom);
    }
    
    if (clamp_to_window)
    {
        var _left = camera_get_view_x(view_camera[0]);
        var _right = _left + camera_get_view_width(view_camera[0]);
        var _top = camera_get_view_y(view_camera[0]);
        var _bottom = _top + camera_get_view_height(view_camera[0]);
        x = clamp(x, _left, _right);
        y = clamp(y, _top, _bottom);
    }
    
    if (clamp_to_room)
    {
        x = clamp(x, 0, room_width);
        y = clamp(y, 0, room_height);
    }
};

aa_x = x;
aa_y = y;
aim_assist_on = true;
aim_assist_precision_distance = global.gamepad_data.gamepad.aim_assist_precision_distance;
aim_assist_precision_amount = global.gamepad_data.gamepad.aim_assist_precision_amount;
aim_assist_radial_angle = global.gamepad_data.gamepad.aim_assist_radial_angle;
aim_assist_radial_amount = global.gamepad_data.gamepad.aim_assist_radial_amount;
aim_assist_snapped_to = -4;
aim_retract_on = global.gamepad_data.gamepad.aim_retract_on;
visible = global.gamepad_data.gamepad.aim_assist_debug_overlay;
goto_x_last = camera_get_view_x(view_camera[0]);
goto_y_last = camera_get_view_y(view_camera[0]);
on_ui_last_frame = false;
cursor_before_pause_x = 0;
cursor_before_pause_y = 0;
ui_last_frame = false;
