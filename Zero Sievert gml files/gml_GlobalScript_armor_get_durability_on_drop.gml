function armor_get_durability_on_drop(arg0)
{
    var _armor_class = item_armor_get_class(arg0);
    var _struct = 
    {
        minimum: 100,
        maximum: 100
    };
    
    switch (_armor_class)
    {
        case 0:
        case 1:
        case 2:
        case 3:
            _struct.minimum = difficulty_get("armor_class_03_dur_min");
            _struct.maximum = difficulty_get("armor_class_03_dur_max");
            break;
        
        case 4:
            _struct.minimum = difficulty_get("armor_class_4_dur_min");
            _struct.maximum = difficulty_get("armor_class_4_dur_max");
            break;
        
        case 5:
            _struct.minimum = difficulty_get("armor_class_5_dur_min");
            _struct.maximum = difficulty_get("armor_class_5_dur_max");
            break;
        
        case 6:
            _struct.minimum = difficulty_get("armor_class_6_dur_min");
            _struct.maximum = difficulty_get("armor_class_6_dur_max");
            break;
    }
    
    return _struct;
}
