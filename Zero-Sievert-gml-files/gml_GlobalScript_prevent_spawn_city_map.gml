function prevent_spawn_city_map()
{
    if (area == UnknownEnum.Value_8)
    {
        ds_grid_set_region(grid_building, 99, 238, 105, 243, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 269, 238, 276, 245, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 260, 175, 263, 199, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 266, 117, 269, 169, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 232, 137, 267, 139, UnknownEnum.Value_1);
        ds_grid_set_region(grid_building, 123, 172, 149, 179, UnknownEnum.Value_1);
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_8 = 8
}
