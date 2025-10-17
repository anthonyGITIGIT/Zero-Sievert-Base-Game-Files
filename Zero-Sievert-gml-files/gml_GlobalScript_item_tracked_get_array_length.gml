function item_tracked_get_array_length(arg0)
{
    if (!item_is_tracked(arg0))
        return 0;
    
    return array_length(variable_struct_get(global.item_tracking_dict, arg0));
}
