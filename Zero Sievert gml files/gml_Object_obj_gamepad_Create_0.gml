connected_devices = [];

for (var i = 0; i <= 11; i++)
{
    if (gamepad_is_connected(i))
        array_push(connected_devices, i);
}

steam_input_init(true);
var _i = 0;
array_of_input_systems[_i++] = new GamepadRaw();
input_decimal = array_create(UnknownEnum.Value_31);
input_value = array_create(UnknownEnum.Value_31);
input_pressed = array_create(UnknownEnum.Value_31);
input_released = array_create(UnknownEnum.Value_31);
input_duration = array_create(UnknownEnum.Value_31);
list_of_axis = array_create(UnknownEnum.Value_31, false);
list_of_axis[UnknownEnum.Value_14] = true;
list_of_axis[UnknownEnum.Value_15] = true;
list_of_axis[UnknownEnum.Value_16] = true;
list_of_axis[UnknownEnum.Value_17] = true;
list_of_axis[UnknownEnum.Value_19] = true;
list_of_axis[UnknownEnum.Value_21] = true;
list_of_axis[UnknownEnum.Value_22] = true;
list_of_axis[UnknownEnum.Value_23] = true;
list_of_axis[UnknownEnum.Value_24] = true;
list_of_axis[UnknownEnum.Value_26] = true;
deadzone_inner = global.gamepad_data.gamepad.gamepad_joystick_inner_deadzone;
deadzone_outer = global.gamepad_data.gamepad.gamepad_joystick_outer_deadzone;
axis_pressed_value = 0.8;
hold_frames = global.gamepad_data.gamepad.frames_for_hold_trigger;
global.is_steamdeck = false;
steam_gamepad_ids = steam_input_get_connected_controllers();
gamepad_manufacturer = scr_gamepad_get_glyph_index();
last_input_keyboard = true;
last_gamepad_pressed = -4;
number_of_gamepads_connected = 0;

function ActionData() constructor
{
    decimal = false;
    value = false;
    pressed = false;
    released = false;
    duration = false;
}

action = array_create(UnknownEnum.Value_41);

for (var i = 0; i < UnknownEnum.Value_41; i++)
    action[i] = new ActionData();

array_create(UnknownEnum.Value_41, UnknownEnum.Value_28);
lookup_action_to_input[UnknownEnum.Value_0] = UnknownEnum.Value_14;
lookup_action_to_input[UnknownEnum.Value_1] = UnknownEnum.Value_15;
lookup_action_to_input[UnknownEnum.Value_2] = UnknownEnum.Value_17;
lookup_action_to_input[UnknownEnum.Value_3] = UnknownEnum.Value_16;
lookup_action_to_input[UnknownEnum.Value_4] = UnknownEnum.Value_18;
lookup_action_to_input[UnknownEnum.Value_5] = UnknownEnum.Value_12;
lookup_action_to_input[UnknownEnum.Value_27] = UnknownEnum.Value_7;
lookup_action_to_input[UnknownEnum.Value_6] = UnknownEnum.Value_0;
lookup_action_to_input[UnknownEnum.Value_7] = UnknownEnum.Value_2;
lookup_action_to_input[UnknownEnum.Value_8] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_9] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_10] = UnknownEnum.Value_10;
lookup_action_to_input[UnknownEnum.Value_11] = UnknownEnum.Value_11;
lookup_action_to_input[UnknownEnum.Value_12] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_13] = UnknownEnum.Value_25;
lookup_action_to_input[UnknownEnum.Value_14] = UnknownEnum.Value_1;
lookup_action_to_input[UnknownEnum.Value_15] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_16] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_17] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_18] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_19] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_20] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_21] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_22] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_23] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_24] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_25] = UnknownEnum.Value_28;
lookup_action_to_input[UnknownEnum.Value_26] = UnknownEnum.Value_2;
lookup_action_to_input[UnknownEnum.Value_28] = UnknownEnum.Value_5;
lookup_action_to_input[UnknownEnum.Value_29] = UnknownEnum.Value_3;
lookup_action_to_input[UnknownEnum.Value_30] = UnknownEnum.Value_2;
lookup_action_to_input[UnknownEnum.Value_31] = UnknownEnum.Value_2;
lookup_action_to_input[UnknownEnum.Value_32] = UnknownEnum.Value_3;
lookup_action_to_input[UnknownEnum.Value_34] = UnknownEnum.Value_4;
lookup_action_to_input[UnknownEnum.Value_33] = UnknownEnum.Value_6;
lookup_action_to_input[UnknownEnum.Value_35] = UnknownEnum.Value_8;
lookup_action_to_input[UnknownEnum.Value_36] = UnknownEnum.Value_9;
lookup_action_to_input[UnknownEnum.Value_37] = UnknownEnum.Value_10;
lookup_action_to_input[UnknownEnum.Value_38] = UnknownEnum.Value_11;
lookup_action_to_input[UnknownEnum.Value_40] = UnknownEnum.Value_1;
lookup_action_to_input[UnknownEnum.Value_39] = UnknownEnum.Value_30;

function reset_action(arg0)
{
    action[arg0].decimal = false;
    action[arg0].value = false;
    action[arg0].pressed = false;
    action[arg0].released = false;
    action[arg0].duration = false;
}

smoothing = global.gamepad_data.gamepad.radial_smoothing;
goto_x = window_get_width() / 2;
goto_y = window_get_height() / 2;
goto_last_x = window_get_width() / 2;
goto_last_y = window_get_height() / 2;
mouse_last_x = device_mouse_raw_x(0);
mouse_last_y = device_mouse_raw_x(0);
aim_assist_override_angle = 0;
aim_assist_override_distance = 0;
shooting_pushback = 0;
gamepad_glyphs = array_create(UnknownEnum.Value_31);

function gamepad_glyph_set(arg0, arg1, arg2, arg3) constructor
{
    standard = arg0;
    outline = arg1;
    pressed = arg2;
    pressed_outline = arg3;
}

gamepad_glyphs[UnknownEnum.Value_0] = new gamepad_glyph_set(s_gamepad_button_face_south_standard, s_gamepad_button_face_south_standard_outline, s_gamepad_button_face_south_pressed, s_gamepad_button_face_south_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_1] = new gamepad_glyph_set(s_gamepad_button_face_east_standard, s_gamepad_button_face_east_standard_outline, s_gamepad_button_face_east_pressed, s_gamepad_button_face_east_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_2] = new gamepad_glyph_set(s_gamepad_button_face_west_standard, s_gamepad_button_face_west_standard_outline, s_gamepad_button_face_west_pressed, s_gamepad_button_face_west_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_3] = new gamepad_glyph_set(s_gamepad_button_face_north_standard, s_gamepad_button_face_north_standard_outline, s_gamepad_button_face_north_pressed, s_gamepad_button_face_north_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_4] = new gamepad_glyph_set(s_gamepad_button_side_left_top_standard, s_gamepad_button_side_left_top_standard_outline, s_gamepad_button_side_left_top_pressed, s_gamepad_button_side_left_top_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_5] = new gamepad_glyph_set(s_gamepad_button_side_left_bottom_standard, s_gamepad_button_side_left_bottom_standard_outline, s_gamepad_button_side_left_bottom_pressed, s_gamepad_button_side_left_bottom_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_6] = new gamepad_glyph_set(s_gamepad_button_side_right_top_standard, s_gamepad_button_side_right_top_standard_outline, s_gamepad_button_side_right_top_pressed, s_gamepad_button_side_right_top_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_7] = new gamepad_glyph_set(s_gamepad_button_side_right_bottom_standard, s_gamepad_button_side_right_bottom_standard_outline, s_gamepad_button_side_right_bottom_pressed, s_gamepad_button_side_right_bottom_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_8] = new gamepad_glyph_set(s_gamepad_button_dpad_north_standard, s_gamepad_button_dpad_north_standard_outline, s_gamepad_button_dpad_north_pressed, s_gamepad_button_dpad_north_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_9] = new gamepad_glyph_set(s_gamepad_button_dpad_south_standard, s_gamepad_button_dpad_south_standard_outline, s_gamepad_button_dpad_south_pressed, s_gamepad_button_dpad_south_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_10] = new gamepad_glyph_set(s_gamepad_button_dpad_west_standard, s_gamepad_button_dpad_west_standard_outline, s_gamepad_button_dpad_west_pressed, s_gamepad_button_dpad_west_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_11] = new gamepad_glyph_set(s_gamepad_button_dpad_east_standard, s_gamepad_button_dpad_east_standard_outline, s_gamepad_button_dpad_east_pressed, s_gamepad_button_dpad_east_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_12] = new gamepad_glyph_set(s_gamepad_button_select_standard, s_gamepad_button_select_standard_outline, s_gamepad_button_select_pressed, s_gamepad_button_select_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_13] = new gamepad_glyph_set(s_gamepad_button_start_standard, s_gamepad_button_start_standard_outline, s_gamepad_button_start_pressed, s_gamepad_button_start_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_28] = new gamepad_glyph_set(s_gamepad_button_start_standard, s_gamepad_button_start_standard_outline, s_gamepad_button_start_pressed, s_gamepad_button_start_pressed_outline);
gamepad_glyphs[UnknownEnum.Value_30] = new gamepad_glyph_set(s_gamepad_button_dpad_none, s_gamepad_button_dpad_none, s_gamepad_button_dpad_none, s_gamepad_button_dpad_none);
alarm[0] = 211;
scr_gamepad_rumble_createEvent();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41
}
