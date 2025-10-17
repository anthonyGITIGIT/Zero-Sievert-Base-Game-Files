function item_tracked_get_track_craft_item(arg0, arg1)
{
    var _array = item_tracked_get_array(arg0);
    var _return = _array[arg1].item_get;
    
    if (_return == undefined)
        return "Cannot find item";
    
    return _return;
}
