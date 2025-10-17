function prevent_spawn_city_map_train()
{
    if (area == UnknownEnum.Value_8)
        ds_grid_set_region(grid_building, 262, 277, 299, 291, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_8 = 8
}
