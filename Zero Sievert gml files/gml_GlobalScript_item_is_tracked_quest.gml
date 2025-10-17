function item_is_tracked_quest(arg0)
{
    return variable_struct_exists(global.item_tracking_dict, arg0);
}
