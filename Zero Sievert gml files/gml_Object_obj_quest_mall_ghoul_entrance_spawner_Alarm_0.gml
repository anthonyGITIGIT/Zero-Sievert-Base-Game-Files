if (is_in_raid())
{
    if (quest_is_active("bridge_to_zakov"))
        scr_place_obj_map(UnknownEnum.Value_614, x, y);
}

enum UnknownEnum
{
    Value_614 = 614
}
