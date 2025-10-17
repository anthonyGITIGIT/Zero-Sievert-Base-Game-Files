function daily_return_map()
{
    var _array_map = [UnknownEnum.Value_1];
    
    if (quest_is_complete("unlock_makeshift_camp"))
        array_push(_array_map, UnknownEnum.Value_2);
    
    if (quest_is_complete("kill_orel"))
        array_push(_array_map, UnknownEnum.Value_3, UnknownEnum.Value_4);
    
    if (quest_is_complete("gate_sewer"))
        array_push(_array_map, UnknownEnum.Value_6);
    
    return _array_map[irandom(array_length(_array_map) - 1)];
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6
}
