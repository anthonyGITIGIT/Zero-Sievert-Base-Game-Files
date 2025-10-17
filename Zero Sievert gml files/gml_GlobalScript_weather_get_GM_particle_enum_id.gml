function weather_get_GM_particle_enum_id(arg0, arg1)
{
    var _type = weather_get_particle_type(arg0, arg1);
    
    switch (_type)
    {
        case "particle_rain_drop":
            return UnknownEnum.Value_3;
            break;
        
        case "particle_rain_splash":
            return UnknownEnum.Value_4;
            break;
        
        case "particle_rad_rain_drop":
            return UnknownEnum.Value_6;
            break;
        
        case "particle_rad_rain_splash":
            return UnknownEnum.Value_7;
            break;
        
        case "particle_snow_drop":
            return UnknownEnum.Value_5;
            break;
        
        case "particle_fog":
            return UnknownEnum.Value_34;
            break;
        
        case "particle_rad_fog":
            return UnknownEnum.Value_35;
            break;
    }
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_34 = 34,
    Value_35
}
