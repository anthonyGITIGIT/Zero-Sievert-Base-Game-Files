function uiResolveFont(arg0)
{
    if (arg0 == "default")
        return __uiDefaultFont;
    
    var _result = asset_get_index(arg0);
    return !font_exists(_result) ? __uiDefaultFont : _result;
}
