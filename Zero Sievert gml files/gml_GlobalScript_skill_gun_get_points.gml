function skill_gun_get_points()
{
    var _count = 0;
    
    with (player_get_local())
    {
        var _key_array = variable_struct_get_names(weapon_mastery.gun_to_mastery_lookup);
        var _key_count = array_length(_key_array);
        
        for (var i = 0; i < _key_count; i++)
        {
            var _mastery_key = _key_array[i];
            var _mastery_value = variable_struct_get(weapon_mastery.gun_to_mastery_lookup, _mastery_key);
            var _pip_count = skills.get_data(_mastery_value).value;
            var _count_of_skills = UiSkillsMasteryPipHasSkills(_mastery_value);
            
            for (var j = 0; j < _pip_count; j++)
            {
                if (_count_of_skills[j] > 0)
                {
                    if (is_undefined(UiSkillsMasteryPipSelectedSkillID(_mastery_value, j)))
                        _count++;
                }
            }
        }
    }
    
    return _count;
}
