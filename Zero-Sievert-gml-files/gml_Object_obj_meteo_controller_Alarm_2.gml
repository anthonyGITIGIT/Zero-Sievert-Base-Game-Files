if (is_in_raid())
{
    if (global.state_emission_now == UnknownEnum.Value_0)
    {
        if (global.is_emission_now == false)
        {
            var _map = obj_map_generator.area;
            
            if (scr_chance(emission_chance[_map]))
            {
                alarm[0] = 2;
                alarm[1] = 1;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0
}
