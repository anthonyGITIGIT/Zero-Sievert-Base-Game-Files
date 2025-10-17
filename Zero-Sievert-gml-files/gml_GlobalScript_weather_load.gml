function weather_load()
{
    db_open("general");
    global.weather = SnapDeepCopy(db_read("weather", "data", weather_empty_struct()));
    
    if (!variable_struct_exists(global.weather, "kit_built"))
        global.weather.kit_built = false;
    
    db_close();
}
