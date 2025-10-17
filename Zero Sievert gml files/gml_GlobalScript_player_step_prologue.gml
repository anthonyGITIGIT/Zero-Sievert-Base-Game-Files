function player_step_prologue()
{
    if (!instance_exists(obj_map_generator))
        exit;
    
    if (obj_map_generator.area == UnknownEnum.Value_10)
    {
        hp = clamp(hp, 20, hp_max);
        wound = 0;
        bleed = 0;
    }
}

enum UnknownEnum
{
    Value_10 = 10
}
