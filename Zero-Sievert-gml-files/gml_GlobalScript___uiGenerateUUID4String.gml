function __uiGenerateUUID4String(arg0 = false)
{
    var _UUID = md5_string_unicode(string(current_time) + string(date_current_datetime()) + string(__uiXORShift32Random(1000000)));
    _UUID = string_set_byte_at(_UUID, 13, 52);
    _UUID = string_set_byte_at(_UUID, 17, ord(__uiXORShift32Choose("8", "9", "a", "b")));
    
    if (arg0)
        _UUID = string_copy(_UUID, 1, 8) + "-" + string_copy(_UUID, 9, 4) + "-" + string_copy(_UUID, 13, 4) + "-" + string_copy(_UUID, 17, 4) + "-" + string_copy(_UUID, 21, 12);
    
    return _UUID;
}
