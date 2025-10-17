function item_get_tracking_materials(arg0)
{
    var _tracking_dict = db_read_ext("general", "tracking", "items", {});
    return variable_struct_get(_tracking_dict, arg0) ?? false;
}
