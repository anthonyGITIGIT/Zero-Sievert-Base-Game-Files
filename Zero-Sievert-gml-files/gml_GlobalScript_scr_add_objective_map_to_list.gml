function scr_add_objective_map_to_list(arg0, arg1, arg2, arg3, arg4)
{
    var xx = arg0 div 16;
    var yy = arg1 div 16;
    var pos_quest = arg2;
    var id_quest = arg3;
    var _sub = arg4;
    var rr = _sub * 1.5;
    var dis = irandom(rr div 2);
    var dir = irandom(360);
    var x1 = xx + lengthdir_x(dis, dir);
    var y1 = yy + lengthdir_y(dis, dir);
    minimap_add_quest_marker(16 * x1, 16 * y1, pos_quest, id_quest, _sub);
}
