function ui_crafting_requirements_populate(arg0)
{
    uiGetData().crafting_loot = arg0;
    var _loot_array = loot_get_crafting_requirement_items(arg0);
    var _destination_struct = uiFind(uiLayerGetRoot("crafting layer"), "requirements inventory");
    _destination_struct.ChildrenClear();
    uiOpenExisting(_destination_struct);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        uiOpen(class_ui_loot_crafting_requirement);
        uiCurrentOpen().Set("loot", _loot);
        uiCurrentOpen().AutoPlace(_destination_struct);
        uiClose();
        _i++;
    }
    
    uiClose();
}
