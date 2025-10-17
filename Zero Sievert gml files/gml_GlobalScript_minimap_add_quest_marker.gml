function minimap_add_quest_marker(arg0, arg1, arg2, arg3, arg4)
{
    ds_list_add(global.list_obj_marker_x, arg0);
    ds_list_add(global.list_obj_marker_y, arg1);
    ds_list_add(global.list_obj_marker_quest_pos, arg2);
    ds_list_add(global.list_obj_marker_quest_id, arg3);
    ds_list_add(global.list_obj_marker_sub, arg4);
}
