function chest_get_item_count_min(arg0)
{
    var _struct = variable_struct_get(global.chest_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Chest \"", arg0, "\" not recognised");
    
    var _value = _struct.item_min;
    
    if (is_string(_value))
    {
        switch (_value)
        {
            case "{skill_scrap_ammo}":
                _value = 5 * global.sk_k[UnknownEnum.Value_66];
                break;
            
            case "{skill_scrap_food}":
                _value = 6 * global.sk_k[UnknownEnum.Value_64];
                break;
            
            case "{skill_scrap_material}":
                _value = 10 * global.sk_k[UnknownEnum.Value_63];
                break;
            
            case "{skill_random_item}":
                _value = 20 * global.sk_k[UnknownEnum.Value_67];
                break;
            
            default:
                trace_error("Chest \"", arg0, "\" returned invalid .item_min string \"", _value, "\"");
                break;
        }
    }
    
    return _value;
}

enum UnknownEnum
{
    Value_63 = 63,
    Value_64,
    Value_66 = 66,
    Value_67
}
