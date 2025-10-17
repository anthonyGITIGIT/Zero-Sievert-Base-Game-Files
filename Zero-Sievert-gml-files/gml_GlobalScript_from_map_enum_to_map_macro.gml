function from_map_enum_to_map_macro(arg0)
{
    var _map = "";
    
    switch (arg0)
    {
        case UnknownEnum.Value_10:
            _map = "forest";
            break;
        
        case UnknownEnum.Value_1:
            _map = "forest";
            break;
        
        case UnknownEnum.Value_2:
            _map = "makeshift_camp";
            break;
        
        case UnknownEnum.Value_3:
            _map = "industrial_area";
            break;
        
        case UnknownEnum.Value_4:
            _map = "swamp";
            break;
        
        case UnknownEnum.Value_6:
            _map = "mall";
            break;
        
        case UnknownEnum.Value_8:
            _map = "city";
            break;
    }
    
    if (_map == "")
        trace_error("A map with enumerator id \"", arg0, "\" does not exists");
    
    return _map;
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_8 = 8,
    Value_10 = 10
}
