function UiSkillsDisplayAllOn(arg0, arg1)
{
    with (player_get_local())
    {
        var _to_return = [];
        var _count_of_all_skills = array_length(global.skills_data_array);
        
        for (var i = 0; i < _count_of_all_skills; i++)
        {
            var _skill_id = global.skills_data_array[i];
            var _this_skill = variable_struct_get(global.skills_data, _skill_id);
            var _this_skill_level = skills.get_value(_skill_id);
            var _get_meta_mastery_data = skills.get_meta_skill_mastery(_skill_id);
            var _count_of_times_same_skill_applied = array_length(_get_meta_mastery_data);
            
            for (var j = 0; j < _count_of_times_same_skill_applied; j++)
            {
                var _meta_data = _get_meta_mastery_data[j];
                array_push(_to_return, 
                {
                    id: _skill_id,
                    name: _this_skill.name,
                    level: string(_this_skill_level),
                    gun_type: _meta_data.gun_type,
                    mastery_pip: string(_meta_data.mastery_pip + 1)
                });
            }
        }
        
        return _to_return;
    }
}
