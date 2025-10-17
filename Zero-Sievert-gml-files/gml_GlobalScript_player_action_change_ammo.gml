function player_action_change_ammo(arg0 = false)
{
    if (global.change_ammo_now)
    {
        if (keyboard_check_pressed(vk_anykey) && !global.kb_pressed[UnknownEnum.Value_23])
            global.change_ammo_now = false;
    }
    
    if (global.change_ammo_now)
    {
        if (mouse_wheel_up() || obj_gamepad.action[UnknownEnum.Value_35].pressed)
            global.change_ammo_scelta++;
        
        if (mouse_wheel_down() || obj_gamepad.action[UnknownEnum.Value_36].pressed)
            global.change_ammo_scelta--;
        
        global.change_ammo_scelta = clamp(global.change_ammo_scelta, 0, ds_list_size(global.list_ammo_id) - 1);
        
        if (global.kb_pressed[UnknownEnum.Value_23] || gamepad_hold_released(UnknownEnum.Value_3) || instance_exists(obj_radial_menu) || arg0)
        {
            global.change_ammo_now = false;
            var _ammo_id_scelto = ds_list_find_value(global.list_ammo_id, global.change_ammo_scelta);
            
            if (_ammo_id_scelto != player_loadout_get_ammo_item(self, weapon_slot_now))
            {
                inventory_add_item(player_loadout_get_ammo_item(self, weapon_slot_now), player_loadout_get_ammo(self, weapon_slot_now));
                player_loadout_set_ammo(weapon_slot_now, 0);
                player_loadout_set_ammo_item(weapon_slot_now, _ammo_id_scelto);
                alarm[0] = 60 * audio_sound_length(item_weapon_get_sound_mag_out(arma_now)) * weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "reload_speed");
                reloading = true;
                state_reload = UnknownEnum.Value_0;
                
                if (player_loadout_get_ammo(self, weapon_slot_now) <= 0 && item_weapon_get_reload_type(arma_now) == "magazine")
                    reload_cocking = true;
                
                audio_play_sound(item_weapon_get_sound_mag_out(arma_now), 10, false);
                db_open(inventory_target_db());
                var _loot_array = db_read("Inventory", "items", []);
                db_close();
                
                if (is_in_hub())
                    db_force_save_soft("pre_raid");
            }
        }
    }
    
    if ((global.kb_pressed[UnknownEnum.Value_23] || obj_gamepad.input_duration[UnknownEnum.Value_3] == obj_gamepad.hold_frames) && global.change_ammo_now == false && item_exists(arma_now) && reloading == false && !switching_weapon)
    {
        global.change_ammo_now = true;
        var _t_ammo = item_get_name(player_loadout_get_ammo_item(self, weapon_slot_now));
        var _t = language_get_string("Currently using:") + " " + _t_ammo;
        scr_draw_text_with_box(_t);
        ds_list_clear(global.list_ammo_id);
        ds_list_clear(global.list_ammo_qnt);
        var _caliber_now = item_weapon_get_caliber(arma_now);
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
            }
            
            _i++;
        }
    }
    
    if (ds_list_size(global.list_ammo_id) < 1 || shoot_input == true || hspd != 0 || vspd != 0)
        global.change_ammo_now = false;
    
    return true;
}

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_23 = 23,
    Value_35 = 35,
    Value_36
}
