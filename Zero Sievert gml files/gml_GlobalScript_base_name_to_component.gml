function base_name_to_component(arg0)
{
    var _enum_index = "";
    
    switch (arg0)
    {
        case "not_a_base":
            _enum_index = UnknownEnum.Value_0;
            break;
        
        case "med_station":
            _enum_index = UnknownEnum.Value_1;
            break;
        
        case "storage":
            _enum_index = UnknownEnum.Value_2;
            break;
        
        case "bed":
            _enum_index = UnknownEnum.Value_3;
            break;
        
        case "kitchen":
            _enum_index = UnknownEnum.Value_4;
            break;
        
        case "recycling":
            _enum_index = UnknownEnum.Value_5;
            break;
        
        case "gym":
            _enum_index = UnknownEnum.Value_6;
            break;
        
        case "shooting_range":
            _enum_index = UnknownEnum.Value_7;
            break;
        
        case "forge":
            _enum_index = UnknownEnum.Value_8;
            break;
        
        case "scavenger":
            _enum_index = UnknownEnum.Value_9;
            break;
        
        case "garden":
            _enum_index = UnknownEnum.Value_10;
            break;
        
        case "ammo":
            _enum_index = UnknownEnum.Value_11;
            break;
        
        case "workshop":
            _enum_index = UnknownEnum.Value_12;
            break;
    }
    
    if (_enum_index == "")
        trace_error("Base id invalid. Probably a typo");
    
    return _enum_index;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12
}
