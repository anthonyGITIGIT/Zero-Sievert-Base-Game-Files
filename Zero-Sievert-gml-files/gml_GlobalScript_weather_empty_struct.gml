function weather_empty_struct()
{
    var _map_weather_array = array_create(24, "sun_1");
    var _map_temperature_array = array_create(24, 15);
    var _struct = 
    {
        kit_built: false,
        temperature_average: 0,
        hour_now: 0,
        last_generated_hour: -99,
        phase: 0,
        phase_day: 0,
        new_day: false,
        map: [
        {
            map_id: "forest",
            hour_since_last_change: 999,
            weather_type: _map_weather_array,
            temperature: _map_temperature_array,
            snow_accumulation: 0
        }, 
        {
            map_id: "makeshift_camp",
            hour_since_last_change: 999,
            weather_type: _map_weather_array,
            temperature: _map_temperature_array,
            snow_accumulation: 0
        }, 
        {
            map_id: "industrial_area",
            hour_since_last_change: 999,
            weather_type: _map_weather_array,
            temperature: _map_temperature_array,
            snow_accumulation: 0
        }, 
        {
            map_id: "swamp",
            hour_since_last_change: 999,
            weather_type: _map_weather_array,
            temperature: _map_temperature_array,
            snow_accumulation: 0
        }, 
        {
            map_id: "mall",
            hour_since_last_change: 999,
            weather_type: _map_weather_array,
            temperature: _map_temperature_array,
            snow_accumulation: 0
        }, 
        {
            map_id: "city",
            hour_since_last_change: 999,
            weather_type: _map_weather_array,
            temperature: _map_temperature_array,
            snow_accumulation: 0
        }]
    };
    return _struct;
}
