function UiSkillsCanSelect(arg0, arg1, arg2)
{
    with (player_get_local())
    {
        if (skills.get_value(arg1) <= arg2)
            return false;
        
        if (skills.get_value(arg0) >= 1)
        {
            var _usage_array = skills.get_meta_skill_mastery(arg0);
            var _usage_count = array_length(_usage_array);
            
            for (var i = 0; i < _usage_count; i++)
            {
                var _this_usage = _usage_array[i];
                
                if (_this_usage.mastery_type == arg1)
                    return false;
            }
            
            return true;
        }
        
        return true;
    }
}
