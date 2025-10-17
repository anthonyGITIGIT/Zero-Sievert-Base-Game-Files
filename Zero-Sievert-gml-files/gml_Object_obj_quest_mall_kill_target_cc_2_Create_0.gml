if (is_in_raid())
{
    if (quest_objective_contract_is_active("kill_assassins", obj_crimson_soldier_quest_assassins_2))
        instance_create_depth(x, y, 0, obj_crimson_soldier_quest_assassins_2);
}
