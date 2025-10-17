var already_done = global.quest_unique_done[UnknownEnum.Value_70];

if (already_done == true)
{
    instance_destroy();
    var _x = x + 0;
    var _y = y + 0;
    ds_grid_set(obj_controller.grid_motion, _x, _y, 0);
    mp_grid_clear_cell(global.grid_move, _x, _y);
}

alarm[10] = 120;

enum UnknownEnum
{
    Value_70 = 70
}
