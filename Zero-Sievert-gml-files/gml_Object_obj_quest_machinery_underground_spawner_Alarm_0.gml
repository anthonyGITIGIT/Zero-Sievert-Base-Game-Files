if (is_in_raid())
{
    if (quest_is_active("machinery"))
        scr_place_obj_map(UnknownEnum.Value_619, x, y);
    
    instance_destroy();
}

enum UnknownEnum
{
    Value_619 = 619
}
