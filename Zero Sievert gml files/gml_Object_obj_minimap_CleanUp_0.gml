if (ds_exists(grid_surface_cover, ds_type_grid))
    ds_grid_destroy(grid_surface_cover);

if (ds_exists(global.list_minimap_marker_x, ds_type_list))
    ds_list_destroy(global.list_minimap_marker_x);

if (ds_exists(global.list_minimap_marker_y, ds_type_list))
    ds_list_destroy(global.list_minimap_marker_y);

if (ds_exists(global.list_minimap_marker_id, ds_type_list))
    ds_list_destroy(global.list_minimap_marker_id);

if (ds_exists(global.list_obj_marker_x, ds_type_list))
    ds_list_destroy(global.list_obj_marker_x);

if (ds_exists(global.list_obj_marker_y, ds_type_list))
    ds_list_destroy(global.list_obj_marker_y);

if (ds_exists(global.list_obj_marker_quest_pos, ds_type_list))
    ds_list_destroy(global.list_obj_marker_quest_pos);

if (ds_exists(global.list_obj_marker_quest_id, ds_type_list))
    ds_list_destroy(global.list_obj_marker_quest_id);

if (ds_exists(global.list_obj_marker_sub, ds_type_list))
    ds_list_destroy(global.list_obj_marker_sub);

if (ds_exists(global.list_extraction_x, ds_type_list))
    ds_list_destroy(global.list_extraction_x);

if (ds_exists(global.list_extraction_y, ds_type_list))
    ds_list_destroy(global.list_extraction_y);

if (ds_exists(global.list_intresting_id, ds_type_list))
    ds_list_destroy(global.list_intresting_id);

if (ds_exists(global.list_intresting_x, ds_type_list))
    ds_list_destroy(global.list_intresting_x);

if (ds_exists(global.list_intresting_y, ds_type_list))
    ds_list_destroy(global.list_intresting_y);

if (surface_exists(surface_map))
{
    surface_free(surface_map);
    surface_map = -1;
}

if (surface_exists(surface_cover))
{
    surface_free(surface_cover);
    surface_cover = -1;
}
