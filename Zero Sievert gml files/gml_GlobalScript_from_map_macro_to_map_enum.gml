function from_map_macro_to_map_enum(arg0)
{
    var _map_enum = UnknownEnum.Value_1;
    
    switch (arg0)
    {
        case "forest":
            _map = UnknownEnum.Value_1;
            break;
        
        case "makeshift_camp":
            _map = UnknownEnum.Value_2;
            break;
        
        case "industrial_area":
            _map = UnknownEnum.Value_3;
            break;
        
        case "swamp":
            _map = UnknownEnum.Value_4;
            break;
        
        case "mall":
            _map = UnknownEnum.Value_6;
            break;
        
        case "city":
            _map = UnknownEnum.Value_8;
            break;
    }
    
    return _map_enum;
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_8 = 8
}
