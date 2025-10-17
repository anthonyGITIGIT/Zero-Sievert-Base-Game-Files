function item_tracked_get_array(arg0)
{
    if (!item_is_tracked(arg0))
        return [];
    
    return variable_struct_get(global.item_tracking_dict, arg0);
}
