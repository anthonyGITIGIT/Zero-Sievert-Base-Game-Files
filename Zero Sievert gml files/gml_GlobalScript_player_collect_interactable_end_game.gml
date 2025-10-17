function player_collect_interactable_end_game()
{
    var _near = instance_nearest(x, y, obj_interact_end_game_options);
    
    if (instance_exists(_near) && distance_to_object(_near) < 64)
    {
        ds_list_add(global.list_interact, UnknownEnum.Value_35);
        ds_list_add(global.list_interact_id, _near);
        ds_list_add(global.list_interact_task_pos, 0);
        ds_list_add(global.list_interact, UnknownEnum.Value_32);
        ds_list_add(global.list_interact_id, _near);
        ds_list_add(global.list_interact_task_pos, 0);
        ds_list_add(global.list_interact, UnknownEnum.Value_34);
        ds_list_add(global.list_interact_id, _near);
        ds_list_add(global.list_interact_task_pos, 0);
        
        if (global.az_done[UnknownEnum.Value_11] || global.az_done[UnknownEnum.Value_1])
        {
            ds_list_add(global.list_interact, UnknownEnum.Value_39);
            ds_list_add(global.list_interact_id, _near);
            ds_list_add(global.list_interact_task_pos, 0);
        }
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_11 = 11,
    Value_32 = 32,
    Value_34 = 34,
    Value_35,
    Value_39 = 39
}
