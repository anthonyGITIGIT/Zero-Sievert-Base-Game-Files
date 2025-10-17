function scr_anomaly_damage(arg0)
{
    var _dam = arg0;
    
    if (!player_local_state_is(scr_player_state_start, scr_player_state_free_camera))
    {
        var _player = player_get_local();
        
        if (item_fits_category(_player.armor_now, "armor"))
        {
            var _armor_id = _player.armor_now;
            var _res = item_armor_get_anomaly(_armor_id);
            _dam = _dam * ((100 - _res) / 100);
            
            if (skill_hunter_obtained("stalker"))
                _dam *= struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("stalker")), variable_get_hash("damage_reduction_multiplier"));
            
            var _dur = player_loadout_get_durability(_player, "armor slot");
            var _dur_dam = 0.03;
            
            if (skill_hunter_obtained("gearlover"))
                _dur_dam *= struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("gearlover")), variable_get_hash("durability_decrease_rate"));
            
            var _new_dur = _dur - _dur_dam;
            _new_dur = clamp(_new_dur, 0, 100);
            player_loadout_set_durability("armor slot", _new_dur);
        }
        
        player_damage_local(_dam);
    }
}
