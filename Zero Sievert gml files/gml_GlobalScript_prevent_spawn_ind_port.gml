function prevent_spawn_ind_port()
{
    if (area == UnknownEnum.Value_3)
        ds_grid_set_region(grid_building, 190, 71, 257, 138, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3
}
