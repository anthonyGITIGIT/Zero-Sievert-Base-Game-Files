function player_step_update_weapon_stats()
{
    if (item_get_category(arma_now) == "weapon")
    {
        var _result = item_weapon_get_modded_stats(arma_now, player_loadout_get_mod_container(self, weapon_slot_now));
        now_recoil = _result.recoil * ((100 + item_ammo_get_recoil(player_loadout_get_ammo_item(self, weapon_slot_now))) / 100) * weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "recoil");
        now_precision = _result.acc * weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "accuracy");
        now_damage = _result.damage * weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "damage");
        now_ergo = _result.ergo * weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "ergonomics");
        now_reload_time = _result.reload_time * weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "reload_speed");
        
        if (switching_weapon)
        {
            if (switching_fase == 0)
            {
            }
            else if (skill_active("fast_hands"))
            {
                now_ergo *= global.skills_data.fast_hands.value_1;
            }
        }
        
        if (frames_left_of_killer_reload > 0)
            now_reload_time *= global.skills_data.killer_reload.value_1;
        
        skills_damage_multiplier = 1;
        
        if (skill_active("empowered_backup") && frames_since_last_swap_weapon <= global.skills_data.empowered_backup.value_2)
            skills_damage_multiplier *= global.skills_data.empowered_backup.value_1;
        
        if (skill_active("first_bullet") && player_loadout_get_ammo(self, weapon_slot_now) >= player_loadout_get_magazine_size(self, weapon_slot_now))
            skills_damage_multiplier *= global.skills_data.first_bullet.value_1;
        
        if (skill_active("suppressive_fire") && shooting_frames >= global.skills_data.suppressive_fire.value_2)
            skills_damage_multiplier *= global.skills_data.suppressive_fire.value_1;
        
        scoped_damage_multiplier = 1;
        
        with (obj_surface_aim)
        {
            var _player = player_get_local();
            
            if (display_scope && player_loadout_get_mod_exists(_player, _player.weapon_slot_now, "scope"))
                other.scoped_damage_multiplier *= _player.weapon_mastery.get_mastery_bonus(item_weapon_get_type(_player.arma_now), "scope_extra_damage");
        }
        
        now_damage *= skills_damage_multiplier;
        now_damage *= scoped_damage_multiplier;
    }
}
