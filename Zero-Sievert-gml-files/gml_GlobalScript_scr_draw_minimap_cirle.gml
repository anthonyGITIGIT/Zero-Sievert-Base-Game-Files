function scr_draw_minimap_cirle(arg0, arg1)
{
    var xx = arg0;
    var yy = arg1;
    var rr = sprite_get_width(s_minimap_circle);
    var dis = irandom(rr div 2);
    var dir = irandom(360);
    var x1 = lengthdir_x(dis, dir);
    var y1 = lengthdir_y(dis, dir);
    draw_sprite(s_minimap_circle, 0, xx + x1, yy + y1);
}
