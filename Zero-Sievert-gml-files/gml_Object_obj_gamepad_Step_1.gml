var _count_of_input_systems = array_length(array_of_input_systems);

for (var i = 0; i < _count_of_input_systems; i++)
{
    var _this_system = array_of_input_systems[i];
    _this_system.update();
    scr_gamepad_calculate_dir_and_angle(_this_system.value);
    scr_gamepad_apply_deadzone(_this_system.value);
}

var _last_value = array_create(UnknownEnum.Value_31, 0);
array_copy(_last_value, 0, input_value, 0, UnknownEnum.Value_31);
input_decimal = array_create(UnknownEnum.Value_31, 0);
input_value = array_create(UnknownEnum.Value_31, 0);
input_pressed = array_create(UnknownEnum.Value_31, 0);
input_released = array_create(UnknownEnum.Value_31, 0);

for (var i = 0; i < _count_of_input_systems; i++)
{
    var _values = array_of_input_systems[i].value;
    
    for (var j = 0; j < UnknownEnum.Value_31; j++)
    {
        input_decimal[j] = max(input_decimal[j], _values[j]);
        input_value[j] = max(input_value[j], input_decimal[j] > axis_pressed_value);
        input_pressed[j] = max(input_pressed[j], _last_value[j] <= 0 && input_value[j] >= 1);
        input_released[j] = max(input_released[j], _last_value[j] >= 1 && input_value[j] <= 0);
        input_duration[j] = max(input_duration[j], input_duration[j] + input_value[j]);
        
        if (input_pressed[j])
            last_input_keyboard = false;
    }
}

input_decimal[UnknownEnum.Value_29] = 0;
input_value[UnknownEnum.Value_29] = 0;
input_pressed[UnknownEnum.Value_29] = 0;
input_released[UnknownEnum.Value_29] = 0;
input_duration[UnknownEnum.Value_29] = 0;

for (var j = 0; j < UnknownEnum.Value_31; j++)
{
    if (j != UnknownEnum.Value_20 && j != UnknownEnum.Value_27)
    {
        if (input_decimal[j] > input_decimal[UnknownEnum.Value_29])
            input_decimal[UnknownEnum.Value_29] = input_decimal[j];
        
        if (input_value[j] > input_value[UnknownEnum.Value_29])
            input_value[UnknownEnum.Value_29] = input_value[j];
        
        if (input_pressed[j] > input_pressed[UnknownEnum.Value_29])
            input_pressed[UnknownEnum.Value_29] = input_pressed[j];
        
        if (input_released[j] > input_released[UnknownEnum.Value_29])
            input_released[UnknownEnum.Value_29] = input_released[j];
        
        if (input_duration[j] > input_duration[UnknownEnum.Value_29])
            input_duration[UnknownEnum.Value_29] = input_duration[j];
    }
}

for (var i = 0; i < UnknownEnum.Value_41; i++)
{
    action[i].decimal = input_decimal[lookup_action_to_input[i]];
    action[i].value = input_value[lookup_action_to_input[i]];
    action[i].pressed = input_pressed[lookup_action_to_input[i]];
    action[i].released = input_released[lookup_action_to_input[i]];
    action[i].duration = input_duration[lookup_action_to_input[i]];
}

if (instance_exists(obj_radial_menu))
{
    reset_action(UnknownEnum.Value_0);
    reset_action(UnknownEnum.Value_1);
    reset_action(UnknownEnum.Value_3);
    reset_action(UnknownEnum.Value_2);
    reset_action(UnknownEnum.Value_10);
    reset_action(UnknownEnum.Value_11);
}

if (input_decimal[UnknownEnum.Value_26] > 0)
{
    if (instance_exists(obj_player))
    {
        var _use_smoothing = 0;
        
        if (obj_gamepad.action[UnknownEnum.Value_28].value)
        {
            var _sensitivity = global.gamepad_data.gamepad.aiming_sensitivity;
            var _last_mouse_x = obj_cursor.x;
            var _last_mouse_y = obj_cursor.y;
            var _new_x = obj_cursor.x + (lengthdir_x(_sensitivity, obj_gamepad.input_decimal[UnknownEnum.Value_27]) * obj_gamepad.input_decimal[UnknownEnum.Value_26]);
            var _new_y = obj_cursor.y + (lengthdir_y(_sensitivity, obj_gamepad.input_decimal[UnknownEnum.Value_27]) * obj_gamepad.input_decimal[UnknownEnum.Value_26]);
            goto_x = _new_x;
            goto_y = _new_y;
        }
        else
        {
            var _dist_min = global.gamepad_data.gamepad.radial_distance_min;
            var _dist_max = global.gamepad_data.gamepad.radial_distance_max;
            var _dist = lerp(_dist_min, _dist_max, obj_gamepad.input_decimal[UnknownEnum.Value_26]);
            
            if (obj_gamepad.input_decimal[UnknownEnum.Value_26] > deadzone_inner)
            {
                _dist_min = global.gamepad_data.gamepad.radial_distance_min;
                _dist_max = global.gamepad_data.gamepad.radial_distance_max;
                _dist = lerp(_dist_min, _dist_max, obj_gamepad.input_decimal[UnknownEnum.Value_26]);
                var _player = player_get_local();
                var _use_dist = min(aim_assist_override_distance, _dist) + shooting_pushback;
                goto_x = _player.x + lengthdir_x(_use_dist, obj_gamepad.input_decimal[UnknownEnum.Value_27] + aim_assist_override_angle);
                goto_y = _player.y + lengthdir_y(_use_dist, obj_gamepad.input_decimal[UnknownEnum.Value_27] + aim_assist_override_angle);
                _use_smoothing = smoothing;
                
                if (!obj_gamepad.last_input_keyboard)
                    shooting_pushback = lerp(0, shooting_pushback, global.gamepad_data.gamepad.shooting_pushback_correction);
                else
                    shooting_pushback = 0;
                
                aim_assist_override_distance = 9999;
                aim_assist_override_angle = 0;
            }
        }
        
        var _new_point_x = lerp(goto_x, goto_last_x, _use_smoothing);
        var _new_point_y = lerp(goto_y, goto_last_y, _use_smoothing);
        move_cursor_room(_new_point_x, _new_point_y);
        goto_last_x = _new_point_x;
        goto_last_y = _new_point_y;
    }
}

if (last_input_keyboard == false)
{
    if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any))
        last_input_keyboard = true;
}

if (global.is_steamdeck)
{
    if (last_input_keyboard)
    {
        if (obj_gamepad.input_pressed[UnknownEnum.Value_29])
            last_input_keyboard = false;
    }
    else if (keyboard_check(vk_anykey) || mouse_check_button(mb_any))
    {
        last_input_keyboard = true;
    }
}

if (obj_gamepad.action[UnknownEnum.Value_33].pressed && is_in_raid() && player_get_local() != -4 && player_get_state() != scr_player_state_weapon_look && !__uiGlobal().__defaultOnion.HasInputReceiver())
{
    var _laser_sprite = undefined;
    var _this_laser_container = player_get_local_var("laser_container_array", []);
    var _container_count = array_length(_this_laser_container);
    
    for (var i = 0; i < _container_count; i++)
    {
        var _icon = _this_laser_container[i].data.att_1.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _laser_sprite = _this_laser_container[i].data.att_1.icon;
            break;
        }
        
        _icon = _this_laser_container[i].data.att_2.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _laser_sprite = _this_laser_container[i].data.att_2.icon;
            break;
        }
        
        _icon = _this_laser_container[i].data.att_3.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _laser_sprite = _this_laser_container[i].data.att_3.icon;
            break;
        }
        
        _icon = _this_laser_container[i].data.att_4.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _laser_sprite = _this_laser_container[i].data.att_4.icon;
            break;
        }
    }
    
    var _torch_sprite = undefined;
    var _this_torch_container = player_get_local_var("torch_container_array", []);
    _container_count = array_length(_this_torch_container);
    
    for (var i = 0; i < _container_count; i++)
    {
        var _icon = _this_torch_container[i].data.att_1.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _torch_sprite = _this_torch_container[i].data.att_1.icon;
            break;
        }
        
        _icon = _this_torch_container[i].data.att_2.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _torch_sprite = _this_torch_container[i].data.att_2.icon;
            break;
        }
        
        _icon = _this_torch_container[i].data.att_3.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _torch_sprite = _this_torch_container[i].data.att_3.icon;
            break;
        }
        
        _icon = _this_torch_container[i].data.att_4.icon;
        
        if (!is_undefined(_icon) && _icon >= 0)
        {
            _torch_sprite = _this_torch_container[i].data.att_4.icon;
            break;
        }
    }
    
    scr_create_radial_menu([new RadialOption(scr_gamepad_scripts_quickslot1, undefined, inventory_find_loot("quick slot 1")), new RadialOption(scr_gamepad_scripts_quickslot2, undefined, inventory_find_loot("quick slot 2")), new RadialOption(scr_gamepad_scripts_quickslot3, undefined, inventory_find_loot("quick slot 3")), new RadialOption(scr_gamepad_scripts_quickslot4, undefined, inventory_find_loot("quick slot 4")), new RadialOption(scr_gamepad_scripts_quickslot5, undefined, inventory_find_loot("quick slot 5")), new RadialOption(scr_gamepad_scripts_quickslot6, undefined, inventory_find_loot("quick slot 6")), new RadialOption(player_action_toggle_laser, _laser_sprite, undefined, language_get_string("Laser on/off")), new RadialOption(player_action_toggle_torch, _torch_sprite, undefined, language_get_string("Torch on/off"))]);
}

if (obj_gamepad.action[UnknownEnum.Value_34].pressed && player_get_local() != -4 && player_get_state() != scr_player_state_weapon_look && !__uiGlobal().__defaultOnion.HasInputReceiver())
{
    var _array_of_items = array_create(8, undefined);
    _array_of_items = [new RadialOption(player_action_toggle_headset, undefined, inventory_find_loot("headset slot"), language_get_string("Headset on/off")), new RadialOption(player_action_weapon_closeup, s_radial_icon_weapon_closeup, undefined, language_get_string("Close-up of the weapon")), new RadialOption(player_action_throw_bolt_spawer, s_bolt, undefined, language_get_string("Throw bolt"), undefined, 2.6, 1, 1)];
    var _next_empty = 3;
    
    if (is_in_hub())
        _array_of_items[_next_empty++] = new RadialOption(player_action_teleport_to_npc, s_radial_icon_quick_move, undefined, language_get_string("Teleport to NPC"));
    
    var _caliber_now = item_weapon_get_caliber(player_get_local_var("arma_now"));
    
    if (!is_undefined(_caliber_now))
    {
        var _ammo_item_array = variable_struct_get(global.caliber_ammo_data, _caliber_now);
        var _a_ammo_qnt = array_create(array_length(_ammo_item_array), 0);
        db_open(inventory_target_db());
        var _loot_array = db_read("Inventory", "items", []);
        db_close();
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            var _ammo_index = array_find_index(_ammo_item_array, _loot.item);
            
            if (_ammo_index != undefined)
                _a_ammo_qnt[_ammo_index] += _loot.quantity;
            
            _i++;
        }
        
        _i = 0;
        
        repeat (array_length(_ammo_item_array))
        {
            if (_a_ammo_qnt[_i] > 0)
            {
                ds_list_add(global.list_ammo_id, _ammo_item_array[_i]);
                ds_list_add(global.list_ammo_qnt, _a_ammo_qnt[_i]);
                _array_of_items[_next_empty++] = new RadialOption(player_loadout_set_ammo_and_start, item_get_sprite_inv(_ammo_item_array[_i]), undefined, item_get_name(_ammo_item_array[_i]), _ammo_item_array[_i], 1.4, 4, 4);
            }
            
            _i++;
        }
    }
    
    scr_create_radial_menu(_array_of_items);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_10 = 10,
    Value_11,
    Value_20 = 20,
    Value_26 = 26,
    Value_27,
    Value_28,
    Value_29,
    Value_31 = 31,
    Value_33 = 33,
    Value_34,
    Value_41 = 41
}
