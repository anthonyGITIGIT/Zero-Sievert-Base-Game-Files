function minimap_get_interesting_marker_text(arg0)
{
    return array_get(obj_controller.marker_text, ds_list_find_value(global.list_intresting_id, arg0));
}
