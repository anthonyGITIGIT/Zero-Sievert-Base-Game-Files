function scr_level_up_skill(arg0, arg1)
{
    var sid = arg0;
    var amount = arg1;
    
    if (sid == UnknownEnum.Value_0 || sid == UnknownEnum.Value_8 || sid == UnknownEnum.Value_4 || sid == UnknownEnum.Value_12)
    {
        amount *= global.sk_k[UnknownEnum.Value_53];
        amount *= difficulty_get("pro_exp_multiplier");
    }
    
    var _destroy = false;
    
    if (global.sk_base[sid] == true)
    {
        var specializzata = false;
        
        for (var i = 0; i < array_length_2d(global.sk_upgrade, sid); i++)
        {
            var get_spec_skill = global.sk_upgrade[sid][i];
            
            if (global.sk_lvl[get_spec_skill] >= 0)
            {
                specializzata = true;
                global.sk_lvl[get_spec_skill] += amount;
                _destroy = true;
                
                if (floor(global.sk_lvl[get_spec_skill]) > global.sk_last_level[get_spec_skill])
                {
                    global.sk_last_level[get_spec_skill] = floor(global.sk_lvl[get_spec_skill]);
                    var get_skill_name = language_get_string(string(global.sk_name[get_spec_skill]));
                    var get_skill_lvl = string(floor(global.sk_lvl[get_spec_skill]));
                    audio_play_sound(snd_level_up, 20, false);
                    var _text = language_get_string("Level up skill");
                    _text = string_replace(_text, "[SKILL_NAME]", get_skill_name);
                    _text = string_replace(_text, "[SKILL_LEVEL]", get_skill_lvl);
                    scr_draw_text_with_box(_text, false);
                }
            }
        }
        
        if (specializzata == false)
        {
            if (global.sk_lvl[sid] < global.sk_lvl_max[sid])
            {
                global.sk_lvl[sid] += amount;
                _destroy = true;
                
                if (floor(global.sk_lvl[sid]) > global.sk_last_level[sid])
                {
                    global.sk_last_level[sid] = floor(global.sk_lvl[sid]);
                    var get_skill_name = language_get_string(string(global.sk_name[sid]));
                    var get_skill_lvl = string(floor(global.sk_lvl[sid]));
                    audio_play_sound(snd_level_up, 20, false);
                    var _text = language_get_string("Level up skill");
                    _text = string_replace(_text, "[SKILL_NAME]", get_skill_name);
                    _text = string_replace(_text, "[SKILL_LEVEL]", get_skill_lvl);
                    scr_draw_text_with_box(_text, false);
                }
            }
        }
    }
    
    return _destroy;
}

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_8 = 8,
    Value_12 = 12,
    Value_53 = 53
}
