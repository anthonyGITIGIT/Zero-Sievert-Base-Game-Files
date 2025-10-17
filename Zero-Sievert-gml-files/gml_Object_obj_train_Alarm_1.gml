if (obj_map_generator.area == UnknownEnum.Value_2)
{
    if (!quest_is_complete("kill_orel"))
    {
        go_back = true;
        stop_x = room_width + 300;
    }
}

if (obj_map_generator.area == UnknownEnum.Value_8)
{
    go_back = true;
    stop_x = room_width + 300;
}

state = UnknownEnum.Value_6;

enum UnknownEnum
{
    Value_2 = 2,
    Value_6 = 6,
    Value_8 = 8
}
