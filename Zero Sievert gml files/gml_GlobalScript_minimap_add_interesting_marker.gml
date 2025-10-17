function minimap_add_interesting_marker(arg0, arg1, arg2)
{
    ds_list_add(global.list_intresting_x, arg0);
    ds_list_add(global.list_intresting_y, arg1);
    ds_list_add(global.list_intresting_id, arg2);
}
