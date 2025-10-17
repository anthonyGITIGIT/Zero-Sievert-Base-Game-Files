function UiSkillsReturnPlacement(arg0, arg1, arg2)
{
    show_debug_message([arg0, arg1, arg2]);
    
    with (player_get_local())
    {
        var _this_skill_data = variable_struct_get(skills.skill_data, arg0);
        var _array_of_places_put = _this_skill_data.meta_skill_mastery;
        var _count_of_places_put = array_length(_array_of_places_put);
        
        for (var i = 0; i < _count_of_places_put; i++)
        {
            var _this_place = _array_of_places_put[i];
            
            if (_this_place.mastery_type == arg1)
                return string(number_to_roman(skills_pip_to_skill_number(_this_place.mastery_pip, arg1)));
        }
        
        return "";
    }
    
    return "Not loaded";
}
