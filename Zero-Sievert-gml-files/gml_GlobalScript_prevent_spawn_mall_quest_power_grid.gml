function prevent_spawn_mall_quest_power_grid()
{
    if (area == UnknownEnum.Value_6)
        ds_grid_set_region(grid_building, 239, 27, 293, 59, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_6 = 6
}
