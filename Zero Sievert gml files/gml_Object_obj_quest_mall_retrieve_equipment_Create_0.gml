if (is_in_raid())
{
    if (quest_is_active("mall_unlock_equipment_ga"))
        instance_create_depth(x, y, 0, obj_chest_quest_retrieve_equipment_ga);
    
    if (quest_is_active("mall_unlock_equipment_cc"))
        instance_create_depth(x, y, 0, obj_chest_quest_retrieve_equipment_cc);
}
