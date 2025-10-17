function player_action_unjam()
{
    if (player_loadout_get_jammed(self, weapon_slot_now))
    {
        player_loadout_set_jammed(weapon_slot_now, false);
        audio_play_sound(snd_jam_free, 10, false);
        
        if (skill_hunter_obtained("nojamthanks"))
            nojamthanks_timer = room_speed * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("nojamthanks")), variable_get_hash("jam_immune_time_seconds"));
    }
}
