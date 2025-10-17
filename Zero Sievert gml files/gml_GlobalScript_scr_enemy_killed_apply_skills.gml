function scr_enemy_killed_apply_skills(arg0)
{
    var _player = player_get_local();
    
    if (skill_active("killer_reload"))
        _player.frames_left_of_killer_reload = global.skills_data.killer_reload.value_2;
}
