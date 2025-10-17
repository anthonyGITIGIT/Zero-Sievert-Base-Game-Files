function prevent_spawn_mall_near_entrance_quest_bridge()
{
    if (area == UnknownEnum.Value_6)
        ds_grid_set_region(grid_building, 239, 61, 246, 66, UnknownEnum.Value_1);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_6 = 6
}
