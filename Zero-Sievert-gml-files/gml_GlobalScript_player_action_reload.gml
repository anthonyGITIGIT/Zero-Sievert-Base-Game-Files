function player_action_reload()
{
    if (player_loadout_exists(self, weapon_slot_now))
    {
        var _ho_ammo = false;
        db_open(inventory_target_db());
        var _loot_array = db_read("Inventory", "items", []);
        db_close();
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            var _item = _loot.item;
            
            if (player_loadout_get_ammo_item(self, weapon_slot_now) == _item && item_fits_category(_item, "ammo") && item_ammo_get_caliber(_item) == item_weapon_get_caliber(arma_now))
            {
                _ho_ammo = true;
                break;
            }
            
            _i++;
        }
        
        if (_ho_ammo)
        {
            if (!audio_is_playing(snd_jam))
            {
                if (player_loadout_get_ammo(self, weapon_slot_now) < player_loadout_get_magazine_size(self, weapon_slot_now))
                {
                    if (!reloading)
                    {
                        var _sound_time = 60 * audio_sound_length(item_weapon_get_sound_mag_out(arma_now));
                        var _sound_time_total = _sound_time * weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "reload_speed");
                        alarm[0] = _sound_time_total;
                        reloading = true;
                        state_reload = UnknownEnum.Value_0;
                        
                        if (player_loadout_get_ammo(self, weapon_slot_now) <= 0 && item_weapon_get_reload_type(arma_now) == "magazine")
                            reload_cocking = true;
                        
                        audio_play_sound(item_weapon_get_sound_mag_out(arma_now), 10, false);
                        var _struct = struct_get_from_hash(item_get_struct(arma_now), variable_get_hash("weapon"));
                        
                        if (variable_struct_exists(_struct, "scripts"))
                        {
                            var _scripts = struct_get_from_hash(_struct, variable_get_hash("scripts"));
                            
                            if (variable_struct_exists(_scripts, "weapon_reload"))
                                struct_get_from_hash(_scripts, variable_get_hash("weapon_reload"))(id);
                        }
                    }
                }
            }
        }
        else
        {
            var _text = language_get_string("No ammo reload");
            scr_draw_text_with_box(string_replace(_text, "[ITEM_NAME]", item_get_name(player_loadout_get_ammo_item(self, weapon_slot_now))));
        }
        
        return true;
    }
    
    return false;
}

enum UnknownEnum
{
    Value_0
}
