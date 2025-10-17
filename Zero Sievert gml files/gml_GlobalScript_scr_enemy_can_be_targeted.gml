function scr_enemy_can_be_targeted(arg0)
{
    with (arg0)
    {
        if (target_relation != UnknownEnum.Value_1 && is_in_raid() && visible && image_alpha > 0.1)
            return true;
    }
    
    return false;
}

enum UnknownEnum
{
    Value_1 = 1
}
