function prevent_spawn_city_map_headquarter_enemies()
{
    if (area == UnknownEnum.Value_8)
        ds_grid_set_region(grid_building, 159, 32, 215, 72, UnknownEnum.Value_2);
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_8 = 8
}
