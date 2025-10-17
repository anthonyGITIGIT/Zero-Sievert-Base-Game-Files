function scr_get_relation(arg0, arg1)
{
    var _mine = arg0;
    var _other = arg1;
    var _rel;
    
    if (object_index == obj_controller)
        _rel = faction_get_rep(_mine, _other);
    else
        _rel = faction_get_rep_temp(_mine, _other);
    
    var _temp_rel = undefined;
    
    if (_rel < 250)
        _temp_rel = UnknownEnum.Value_2;
    
    if (_rel >= 250 && _rel <= 600)
        _temp_rel = UnknownEnum.Value_0;
    
    if (_rel > 600)
        _temp_rel = UnknownEnum.Value_1;
    
    return _temp_rel ?? 0;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
