function minimap_get_quest_marker_text(arg0)
{
    return variable_struct_get(global.quest_database, ds_list_find_value(global.list_obj_marker_quest_id, arg0)).name;
}
