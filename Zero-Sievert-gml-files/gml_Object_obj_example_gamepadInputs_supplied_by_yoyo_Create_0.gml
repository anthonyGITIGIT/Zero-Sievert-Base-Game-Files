steam_input_init(false);
steam_input_enable_device_callbacks();
steam_utils_enable_callbacks();
controllers = [];
spriteMap = {};

ensureSpriteExists = function(arg0)
{
    if (!variable_struct_exists(spriteMap, arg0))
    {
        var _spr = sprite_add(arg0, 1, false, false, 0, 0);
        variable_struct_set(spriteMap, arg0, _spr);
        show_debug_message("Loaded origin png " + arg0);
    }
    
    return variable_struct_get(spriteMap, arg0);
};

showFloatingKeyboard = function()
{
    return steam_show_floating_gamepad_text_input(0, window_get_x(), window_get_y() / 2, window_get_width(), window_get_height() / 2);
};

nil_handle = int64("0");
action_sets = 
{
    ship_controls: nil_handle
};
digital_actions = {};
analog_actions = {};

update_handles = function()
{
    if (action_sets.ship_controls == nil_handle)
    {
        action_sets.ship_controls = steam_input_get_action_set_handle("ship_controls");
        action_sets.menu_controls = steam_input_get_action_set_handle("menu_controls");
        action_sets.thrust_action_layer = steam_input_get_action_set_handle("thrust_action_layer");
        digital_actions.turn_left = steam_input_get_digital_action_handle("turn_left");
        digital_actions.turn_right = steam_input_get_digital_action_handle("turn_right");
        digital_actions.forward_thrust = steam_input_get_digital_action_handle("forward_thrust");
        digital_actions.backward_thrust = steam_input_get_digital_action_handle("backward_thrust");
        digital_actions.fire_lasers = steam_input_get_digital_action_handle("fire_lasers");
        digital_actions.pause_menu = steam_input_get_digital_action_handle("pause_menu");
        digital_actions.menu_up = steam_input_get_digital_action_handle("menu_up");
        digital_actions.menu_down = steam_input_get_digital_action_handle("menu_down");
        digital_actions.menu_left = steam_input_get_digital_action_handle("menu_left");
        digital_actions.menu_right = steam_input_get_digital_action_handle("menu_right");
        digital_actions.menu_select = steam_input_get_digital_action_handle("menu_select");
        digital_actions.menu_cancel = steam_input_get_digital_action_handle("menu_cancel");
        analog_actions.analog_controls = steam_input_get_analog_action_handle("analog_controls");
    }
};

exit;
steam_input_set_dualsense_trigger_effect(0, 
{
    trigger_mask: 3,
    command: [
    {
        mode: 6,
        command_data: 
        {
            feedback_param: 
            {
                position: 0,
                strength: 0
            },
            weapon_param: 
            {
                start_position: 0,
                end_position: 0,
                strength: 0
            },
            vibration_param: 
            {
                position: 0,
                amplitude: 0,
                frequency: 0
            },
            multiple_position_feedback_param: 
            {
                strength: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            },
            slope_feedback_param: 
            {
                start_position: 0,
                end_position: 0,
                start_strength: 0,
                end_strength: 0
            },
            multiple_position_vibration_param: 
            {
                frequency: 0,
                amplitude: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            }
        }
    }, 
    {
        mode: 0,
        command_data: {}
    }]
});
