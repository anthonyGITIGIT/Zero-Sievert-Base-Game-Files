function UiMouseOverContext()
{
    var _ui = uiFind(__uiRootStackTop(), "context menu");
    
    if (!is_struct(_ui))
        return false;
    
    var _count = array_length(_ui.__children);
    
    for (var i = 0; i < _count; i++)
    {
        var _this_button = _ui.__children[i];
        
        if (_this_button.GetHover())
            return true;
    }
    
    return false;
}
