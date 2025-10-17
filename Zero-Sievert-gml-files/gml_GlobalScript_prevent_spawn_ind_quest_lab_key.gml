function prevent_spawn_ind_quest_lab_key()
{
    if (area == UnknownEnum.Value_3)
        ds_grid_set_region(grid_building, 65, 44, 79, 54, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3
}
