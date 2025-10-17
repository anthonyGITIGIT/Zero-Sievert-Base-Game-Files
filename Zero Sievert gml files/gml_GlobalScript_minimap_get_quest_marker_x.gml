function minimap_get_quest_marker_x(arg0)
{
    return (ds_list_find_value(global.list_obj_marker_x, arg0) * 4) / 16;
}
