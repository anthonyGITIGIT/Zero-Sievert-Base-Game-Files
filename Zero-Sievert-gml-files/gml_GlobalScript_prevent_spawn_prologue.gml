function prevent_spawn_prologue()
{
    if (area == UnknownEnum.Value_10)
    {
        ds_grid_set_region(grid_building, 44, 99, 58, 112, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 49, 58, 62, 71, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 107, 57, 133, 86, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 81, 176, 105, 199, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 26, 177, 54, 201, UnknownEnum.Value_1);
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_10 = 10
}
