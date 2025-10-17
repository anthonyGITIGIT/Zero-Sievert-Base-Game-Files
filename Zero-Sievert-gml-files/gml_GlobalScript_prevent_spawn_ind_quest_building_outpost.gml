function prevent_spawn_ind_quest_building_outpost()
{
    if (area == UnknownEnum.Value_3)
        ds_grid_set_region(grid_building, 192, 96, 200, 102, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3
}
