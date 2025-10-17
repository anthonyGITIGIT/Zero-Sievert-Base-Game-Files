if (is_in_raid())
{
    if (!quest_is_complete("new_arrivals"))
        instance_create_depth(x, y, 0, obj_enemy_infestation_port_3);
}
