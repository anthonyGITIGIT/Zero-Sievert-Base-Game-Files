function scr_scala_item_stat(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var xx = arg0;
    var yy = arg1;
    var max_value = arg3;
    var stat_valuex = xx + off_n_v;
    var stat_valuey = yy + 2;
    var stat_sprite_w = sprite_get_width(s_hud_inv_stat);
    var cosa_scalare = arg4;
    draw_text(xx + global.language_font_offset.x, yy + global.language_font_offset.y, arg2);
    draw_sprite(s_hud_inv_stat, 0, stat_valuex, stat_valuey);
    var scala = (stat_sprite_w * cosa_scalare) / max_value;
    
    if (arg5 == true)
        scala = stat_sprite_w - scala;
    
    scala = clamp(scala, 0, stat_sprite_w);
    draw_sprite_ext(s_hud_inv_stat2, 0, stat_valuex, stat_valuey, scala, 1, 0, c_white, 1);
    draw_sprite(s_hud_inv_stat, 1, stat_valuex, stat_valuey);
}
