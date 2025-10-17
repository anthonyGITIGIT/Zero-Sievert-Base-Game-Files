function prevent_spawn_mall_near_entrances()
{
    if (area == UnknownEnum.Value_6)
        ds_grid_set_region(grid_building, 79, 54, 232, 134, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_6 = 6
}
