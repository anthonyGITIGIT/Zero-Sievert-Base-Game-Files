function weather_get_particle_offset(arg0)
{
    var _struct_offset = 
    {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
    };
    
    switch (arg0)
    {
        case UnknownEnum.Value_3:
        case UnknownEnum.Value_6:
            _struct_offset.left = -64;
            _struct_offset.right = 64;
            _struct_offset.top = -16;
            _struct_offset.bottom = 0;
            break;
        
        case UnknownEnum.Value_4:
        case UnknownEnum.Value_7:
            _struct_offset.left = -64;
            _struct_offset.right = 64;
            _struct_offset.top = -16;
            _struct_offset.bottom = 270;
            break;
        
        case UnknownEnum.Value_5:
            _struct_offset.left = -150;
            _struct_offset.right = 150;
            _struct_offset.top = -16;
            _struct_offset.bottom = 100;
            break;
        
        case UnknownEnum.Value_34:
        case UnknownEnum.Value_35:
            _struct_offset.left = -100;
            _struct_offset.right = 100;
            _struct_offset.top = -100;
            _struct_offset.bottom = 370;
            break;
    }
    
    return _struct_offset;
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_34 = 34,
    Value_35
}
