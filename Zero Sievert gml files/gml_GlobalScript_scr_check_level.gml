function scr_check_level()
{
    if (global.xp_level_now >= array_length(struct_get_from_hash(global.xp_data, variable_get_hash("levels"))))
        global.xp = 0;
    
    global.xp = clamp(global.xp, 0, experience_get_for_level_max());
    var _xp_goal = experience_get_for_level(global.xp_level_now);
    
    if (global.xp >= _xp_goal)
    {
        global.xp_level_now++;
        global.xp -= _xp_goal;
        scr_save_exp();
        
        if (is_in_hub())
        {
            with (obj_trader)
            {
                alarm[0] = 1;
                gamedata_trader_calculate_shared_money();
            }
            
            with (obj_speaker_parent)
            {
                lista_text();
                alarm[10] = 1;
            }
        }
    }
}
