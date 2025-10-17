function minimap_add_custom_marker(arg0, arg1)
{
    var _minimap = uiFindRelaxed(uiLayerGetRoot("pda layer"), "minimap scroll box");
    
    if (_minimap != undefined)
    {
        var _id = __uiGenerateUUID4String();
        var _new_x = arg0 - (_minimap.Get("worldLeft") - _minimap.scrollX);
        var _new_y = arg1 - (_minimap.Get("worldTop") - _minimap.scrollY);
        ds_list_add(global.list_minimap_marker_x, _new_x);
        ds_list_add(global.list_minimap_marker_y, _new_y);
        ds_list_add(global.list_minimap_marker_id, _id);
        
        if (instance_exists(obj_prologue))
        {
            if (obj_prologue.state == UnknownEnum.Value_22)
            {
                obj_prologue.timer_go = 1;
                obj_prologue.timer_max = 5;
            }
        }
        
        uiOpenExisting(_minimap);
        uiOpen(class_ui_minimap_custom_marker);
        uiCurrentOpen().Set("x", _new_x);
        uiCurrentOpen().Set("y", _new_y);
        uiCurrentOpen().Set("markerID", _id);
        uiClose();
        uiClose();
    }
}

enum UnknownEnum
{
    Value_22 = 22
}
