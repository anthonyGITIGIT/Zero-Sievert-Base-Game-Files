if (obj_map_generator.state == UnknownEnum.Value_21)
{
    if (!enter_raid_event_performed && is_in_raid())
    {
        mods_perform_event("enter_raid");
        enter_raid_event_performed = true;
    }
    
    alpha_screen -= a_amount;
    
    if (alpha_screen <= 0)
        instance_destroy();
}

player_follow_local();

enum UnknownEnum
{
    Value_21 = 21
}
