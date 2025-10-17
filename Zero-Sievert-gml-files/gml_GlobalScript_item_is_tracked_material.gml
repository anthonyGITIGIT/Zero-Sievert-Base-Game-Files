function item_is_tracked_material(arg0)
{
    return variable_struct_get(global.item_tracking_dict, arg0) ?? false;
}
