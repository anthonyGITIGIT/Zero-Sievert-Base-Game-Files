function ui_debug_spawner_populate(arg0, arg1)
{
    var _destination_struct = uiFind(uiLayerGetRoot("debug layer"), "craft inventory");
    _destination_struct.ChildrenClear();
    uiOpenExisting(_destination_struct);
    var _spawner_data = variable_struct_get(global.item_debug_spawner_data, arg0);
    
    if (!is_struct(_spawner_data))
        trace_error("Debug spawner category \"", _category, "\" not recognised");
    
    var _loot_array = _spawner_data.loot_array;
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (_loot.page == arg1)
        {
            uiOpen(class_ui_loot_debug_spawner);
            uiCurrentOpen().Set("loot", _loot);
            uiClose();
        }
        
        _i++;
    }
    
    uiClose();
}
