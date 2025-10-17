function scr_enemy_choose_move_pos(arg0, arg1, arg2)
{
    var pos_x = arg0;
    var pos_y = arg1;
    var range = irandom_range(arg2 div 2, arg2);
    var _dir = irandom(360);
    move_point_x = pos_x + lengthdir_x(range, _dir);
    move_point_y = pos_y + lengthdir_y(range, _dir);
}
