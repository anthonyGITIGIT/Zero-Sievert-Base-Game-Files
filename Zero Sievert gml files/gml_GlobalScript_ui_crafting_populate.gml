function ui_crafting_populate(arg0)
{
    var _loot_array = crafting_mode_get_loot_array(arg0);
    var _ui_constructor = crafting_mode_get_ui_constructor(arg0);
    ui_crafting_requirements_populate(undefined);
    var _destination_struct = uiFind(uiLayerGetRoot("crafting layer"), "craft inventory");
    _destination_struct.ChildrenClear();
    uiOpenExisting(_destination_struct);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        uiOpen(_ui_constructor);
        uiCurrentOpen().Set("loot", _loot);
        uiCurrentOpen().AutoPlace(_destination_struct);
        uiClose();
        _i++;
    }
    
    uiClose();
}
