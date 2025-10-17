function minimap_get_extraction_marker_y(arg0)
{
    return (ds_list_find_value(global.list_extraction_y, arg0) * 4) / 16;
}
