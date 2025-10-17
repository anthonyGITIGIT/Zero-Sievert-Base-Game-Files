function bullet_spawn_add_data(arg0)
{
    with (arg0)
    {
        if (skill_active("vital_shooting") && object_is_player(shooter_id))
        {
            collision_point_list(obj_cursor.aa_x, obj_cursor.aa_y, obj_npc_parent, true, true, enemies_under_cursor, false);
            var _list_size = ds_list_size(enemies_under_cursor);
            
            for (var i = 0; i < _list_size; i++)
                enemies_under_cursor_frames[i] = ds_list_find_value(enemies_under_cursor, i).skill_vital_shooting_frames;
        }
    }
}
