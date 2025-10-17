function loot_action_get_y_offset(arg0, arg1)
{
    var _array_length = array_length(loot_action_get_array(arg0));
    var _h = _array_length * arg1;
    
    if ((uiPointerGetY() + _h) > 1080)
        return 1080 - (uiPointerGetY() + _h);
    
    return 0;
}
