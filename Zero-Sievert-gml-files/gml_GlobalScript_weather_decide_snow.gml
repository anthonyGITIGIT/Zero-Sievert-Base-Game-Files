function weather_decide_snow(arg0)
{
    if (weather_get_temperature_now() <= 1)
    {
        switch (arg0)
        {
            case "rain_1":
                return "snow_1";
                break;
            
            case "rain_2":
                return "snow_2";
                break;
            
            case "rain_3":
                return "snow_3";
                break;
        }
    }
    
    return arg0;
}
