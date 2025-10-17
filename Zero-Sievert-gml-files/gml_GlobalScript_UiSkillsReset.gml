function UiSkillsReset(arg0, arg1, arg2)
{
    with (player_get_local())
    {
        var _array_of_skill_ids = mastery_to_skills.get_abilities(arg1, arg2);
        var _gun_type = variable_struct_get(weapon_mastery.mastery_to_gun_lookup, arg1);
        var _count_of_skills = array_length(_array_of_skill_ids);
        
        for (var i = 0; i < _count_of_skills; i++)
        {
            var _this_skill_id = _array_of_skill_ids[i];
            var _usage_array = skills.get_meta_skill_mastery(_this_skill_id);
            var _usage_count = array_length(_usage_array);
            
            for (var j = 0; j < _usage_count; j++)
            {
                var _this_usage = _usage_array[j];
                
                if (_this_usage.mastery_type == arg1 && _this_usage.mastery_pip == arg2)
                {
                    skills.delete_meta_skill_mastery(_this_skill_id, j);
                    j--;
                    _usage_count--;
                }
                else if (_this_usage.mastery_type == arg1 && _this_skill_id == arg0)
                {
                    skills.delete_meta_skill_mastery(_this_skill_id, j);
                    j--;
                    _usage_count--;
                }
                else
                {
                }
            }
            
            if (_usage_count <= 0)
                skills.set(_this_skill_id, 0);
        }
    }
}
