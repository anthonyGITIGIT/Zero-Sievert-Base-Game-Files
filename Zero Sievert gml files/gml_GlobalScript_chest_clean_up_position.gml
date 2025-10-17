function chest_clean_up_position(arg0, arg1)
{
    static _result = {};
    
    _result.x = clamp(16 * round(arg0 / 16), 0, 128);
    _result.y = clamp(16 * round(arg1 / 16), 0, 176);
    return _result;
}
