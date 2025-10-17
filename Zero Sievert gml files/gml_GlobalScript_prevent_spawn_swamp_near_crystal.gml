function prevent_spawn_swamp_near_crystal()
{
    if (area == UnknownEnum.Value_4)
        ds_grid_set_region(grid_building, 175, 0, 299, 91, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_4 = 4
}
