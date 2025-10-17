function ui_inventory_add_loot(arg0, arg1, arg2, arg3 = true)
{
    var _root = uiLayerGetRoot("inventory layer");
    var _destination = uiFind(_root, arg1);
    uiOpenExisting(_root);
    var _ui_element = uiOpen(arg2);
    uiCurrentOpen().Set("loot", arg0);
    uiClose();
    uiClose();
    var _base_rotation = arg0.rotation;
    var _autoplace_results = _ui_element.AutoPlace(_destination, arg3, true);
    
    if (_autoplace_results == true)
    {
        arg0.placement = arg1;
        
        if (_ui_element.Get("rotation") != 0)
        {
            if (_base_rotation == 0)
                _ui_element.__SetRotatedSize(1);
            else
                _ui_element.__SetRotatedSize(0);
        }
        
        return true;
    }
    else
    {
        uiDestroy(_ui_element);
        
        if (arg3 && _autoplace_results == false)
            return true;
        
        return false;
    }
}
