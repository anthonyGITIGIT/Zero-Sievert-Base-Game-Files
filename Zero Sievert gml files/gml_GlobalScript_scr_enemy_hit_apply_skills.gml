function scr_enemy_hit_apply_skills(arg0)
{
    if (skill_active("impaler_shot_1"))
        arg0.frames_left_of_impaler_shot_1 = global.skills_data.impaler_shot_1.value_2;
    
    if (skill_active("impaler_shot_2"))
        arg0.frames_left_of_impaler_shot_2 = global.skills_data.impaler_shot_2.value_2;
    
    if (skill_active("prolonged_vision"))
        arg0.frames_left_of_prolonged_vision = global.skills_data.prolonged_vision.value_2;
}
