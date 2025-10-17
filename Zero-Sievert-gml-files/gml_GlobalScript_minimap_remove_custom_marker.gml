function minimap_remove_custom_marker(arg0)
{
    var _index = ds_list_find_index(global.list_minimap_marker_id, arg0);
    
    if (_index < 0)
        exit;
    
    ds_list_delete(global.list_minimap_marker_x, _index);
    ds_list_delete(global.list_minimap_marker_y, _index);
    ds_list_delete(global.list_minimap_marker_id, _index);
    var _minimap = uiFindRelaxed(uiLayerGetRoot("pda layer"), "minimap scroll box");
    
    if (_minimap != undefined)
    {
        var _array = uiFindAllType(_minimap, "class_ui_minimap_custom_marker");
        var _i = 0;
        
        repeat (array_length(_array))
        {
            var _marker = _array[_i];
            
            if (_marker.markerID == arg0)
            {
                uiDestroy(_marker);
                break;
            }
            
            _i++;
        }
    }
}
