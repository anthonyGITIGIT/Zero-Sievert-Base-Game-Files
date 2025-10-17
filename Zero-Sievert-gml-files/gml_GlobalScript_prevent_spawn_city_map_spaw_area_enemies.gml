function prevent_spawn_city_map_spaw_area_enemies()
{
    if (area == UnknownEnum.Value_8)
        ds_grid_set_region(grid_building, 262, 278, 299, 289, UnknownEnum.Value_2);
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_8 = 8
}
