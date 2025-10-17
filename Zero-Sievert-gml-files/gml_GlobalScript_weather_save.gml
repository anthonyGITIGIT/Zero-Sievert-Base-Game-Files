function weather_save()
{
    db_open("general");
    db_write("weather", "data", global.weather);
    db_close();
}
