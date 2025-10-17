function skills_pip_to_skill_number(arg0, arg1)
{
    with (player_get_local())
    {
        var _ability_data = [];
        var _full_ability_data = mastery_to_skills.ability_data;
        var _full_ability_data_count = array_length(_full_ability_data);
        
        for (var i = 0; i < _full_ability_data_count; i++)
        {
            if (_full_ability_data[i].mastery_string == arg1)
                array_push_unique(_ability_data, _full_ability_data[i].rank);
        }
        
        array_sort(_ability_data, true);
        var _answer = array_find_index(_ability_data, arg0 + 1);
        show_debug_message([arg0, _answer, _ability_data]);
        
        if (is_undefined(_answer))
            return 0;
        else
            return _answer + 1;
    }
}
