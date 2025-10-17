function UiSkillsMasteryPipSelectedSkillID(arg0, arg1)
{
    with (player_get_local())
    {
        var _skills_at_rank = mastery_to_skills.get_abilities(arg0, arg1);
        var _skill_count = array_length(_skills_at_rank);
        
        for (var i = 0; i < _skill_count; i++)
        {
            var _skill_id = _skills_at_rank[i];
            var _usage_array = skills.get_meta_skill_mastery(_skill_id);
            var _usage_count = array_length(_usage_array);
            
            for (var j = 0; j < _usage_count; j++)
            {
                var _this_usage = _usage_array[j];
                
                if (_this_usage.mastery_type == arg0 && _this_usage.mastery_pip == arg1)
                    return _skill_id;
            }
        }
        
        return undefined;
    }
}
