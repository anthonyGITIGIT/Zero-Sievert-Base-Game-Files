function skill_hunter_get_points()
{
    var _total_points = experience_get_level();
    
    with (player_get_local())
    {
        for (var i = 0; i < array_length(global.skills_hunter_data_array); i++)
        {
            if (skills_hunter.get_value(global.skills_hunter_data_array[i]) > 0)
            {
                if (variable_struct_get(global.skills_hunter_data, global.skills_hunter_data_array[i]).group > -1)
                    _total_points--;
            }
        }
    }
    
    return _total_points;
}
