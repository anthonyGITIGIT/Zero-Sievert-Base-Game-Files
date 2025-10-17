function minimap_remove_interesting_marker_by_id(arg0)
{
    for (var i = 0; i < minimap_get_interesting_marker_count(); i++)
    {
        if (ds_list_find_value(global.list_intresting_id, i) == arg0)
        {
            ds_list_delete(global.list_intresting_x, i);
            ds_list_delete(global.list_intresting_y, i);
            ds_list_delete(global.list_intresting_id, i);
        }
    }
}
