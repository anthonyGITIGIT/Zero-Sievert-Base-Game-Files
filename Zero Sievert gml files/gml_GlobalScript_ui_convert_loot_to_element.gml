function ui_convert_loot_to_element(arg0, arg1, arg2 = arg0.placement, arg3 = uiLayerGetRoot("inventory layer"))
{
    if (arg0.quantity <= 0)
    {
        trace("Failed to convert loot to element, quantity is less than 0");
        return undefined;
    }
    
    var _ui = undefined;
    var _destination_struct = uiFindRelaxed(arg3, arg2);
    
    if (_destination_struct != undefined)
    {
        uiOpenExisting(_destination_struct);
        _ui = uiOpen(arg1);
        uiCurrentOpen().Set("loot", arg0);
        uiClose();
        uiClose();
    }
    else
    {
        trace(["Failed to find _destination_struct for ui_convert_loot_to_element", "Placement: " + string(arg2)]);
    }
    
    return _ui;
}
