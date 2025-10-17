if (!reloading)
    exit;

switch (state_reload)
{
    case UnknownEnum.Value_0:
        var _sound_time = now_reload_time;
        alarm[0] = round(_sound_time);
        state_reload = UnknownEnum.Value_1;
        break;
    
    case UnknownEnum.Value_1:
        var _weapon_reload_type = item_weapon_get_reload_type(arma_now);
        var _current_ammo_item = player_loadout_get_ammo_item(self, weapon_slot_now);
        var _current_ammo = player_loadout_get_ammo(self, weapon_slot_now);
        var _current_ammo_max = player_loadout_get_magazine_size(self, weapon_slot_now);
        var _deficit = max(0, _current_ammo_max - _current_ammo);
        var sound_shell_in = snd_estrarre_caricatore;
        
        switch (_weapon_reload_type)
        {
            case "sniper_single":
                sound_shell_in = snd_sniper_shell_in;
                break;
            
            case "shotgun_single":
                sound_shell_in = snd_shotgun_shell_in;
                break;
            
            case "magazine":
                sound_shell_in = snd_estrarre_caricatore;
                break;
        }
        
        var _sound_time = audio_sound_length(sound_shell_in) * room_speed;
        alarm[0] = _sound_time;
        var ci_sono_ammo_per_reload_shell = false;
        var _played_sound = false;
        db_open(inventory_target_db());
        var _loot_array = db_read("Inventory", "items", []);
        db_close();
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            var _item = _loot.item;
            
            if (_item == _current_ammo_item)
            {
                ci_sono_ammo_per_reload_shell = true;
                var _skill_reload = false;
                
                if (skill_active("reload_artist_double_barrel") && item_weapon_get_magazine(arma_now) == 2)
                    _skill_reload = true;
                
                if ((_weapon_reload_type == "shotgun_single" || _weapon_reload_type == "sniper_single") && !_skill_reload)
                {
                    if (_deficit <= 0)
                    {
                        state_reload = UnknownEnum.Value_2;
                        break;
                    }
                    else
                    {
                        _deficit = 1;
                        state_reload = UnknownEnum.Value_0;
                        
                        if (!_played_sound)
                        {
                            _played_sound = true;
                            audio_play_sound(sound_shell_in, 10, false);
                        }
                    }
                }
                else if (_weapon_reload_type == "magazine" || _skill_reload)
                {
                    state_reload = UnknownEnum.Value_2;
                    
                    if (!_played_sound)
                    {
                        _played_sound = true;
                        audio_play_sound(sound_shell_in, 10, false);
                    }
                }
                
                if (_deficit > 0)
                {
                    if (_deficit < _loot.quantity)
                    {
                        var _ammo = player_loadout_get_ammo(self, weapon_slot_now);
                        _ammo += _deficit;
                        player_loadout_set_ammo(weapon_slot_now, _ammo);
                        _loot.quantity -= _deficit;
                        _deficit = 0;
                        break;
                    }
                    else if (_deficit >= _loot.quantity)
                    {
                        var _ammo = player_loadout_get_ammo(self, weapon_slot_now);
                        _ammo += _loot.quantity;
                        player_loadout_set_ammo(weapon_slot_now, _ammo);
                        _deficit -= _loot.quantity;
                        array_delete(_loot_array, _i, 1);
                        _i--;
                    }
                }
            }
            
            _i++;
        }
        
        if (is_in_hub())
            db_force_save_soft("pre_raid");
        
        if (!ci_sono_ammo_per_reload_shell)
            state_reload = UnknownEnum.Value_2;
        
        break;
    
    case UnknownEnum.Value_2:
        audio_play_sound(item_weapon_get_sound_mag_in(arma_now), 10, false);
        var _sound_time = audio_sound_length(item_weapon_get_sound_mag_in(arma_now)) * room_speed;
        var _sound_time_total = _sound_time;
        alarm[0] = _sound_time_total;
        state_reload = UnknownEnum.Value_3;
        player_loadout_set_jammed(weapon_slot_now, false);
        break;
    
    case UnknownEnum.Value_3:
        if (reload_cocking)
        {
            audio_play_sound(item_weapon_get_sound_cocking(arma_now), 10, false);
            var sound_time = audio_sound_length(item_weapon_get_sound_cocking(arma_now)) * room_speed;
            alarm[0] = sound_time;
            state_reload = UnknownEnum.Value_4;
            reload_cocking = false;
        }
        else
        {
            alarm[0] = 1;
            state_reload = UnknownEnum.Value_4;
        }
        
        player_loadout_set_jammed(weapon_slot_now, false);
        break;
    
    case UnknownEnum.Value_4:
        reloading = false;
        reload_cocking = false;
        db_open(inventory_target_db());
        var _loot_array = db_read("Inventory", "items", []);
        db_close();
        
        if (is_in_hub())
            db_force_save_soft("pre_raid");
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4
}
