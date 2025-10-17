var sw = sprite_get_width(s_hud_minimap_menu);
var sh = sprite_get_height(s_hud_minimap_menu);
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
language_set_font(UnknownEnum.Value_0);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var offy = 3;
var t_create = "Add new Marker";
var t_des = "Remove Marker";

if (position_now == UnknownEnum.Value_0)
{
    draw_sprite(s_hud_minimap_menu, 0, startx - camx, starty - camy);
    draw_sprite(s_hud_minimap_menu, 0, startx - camx, (starty - camy) + sh);
    draw_text(((startx + global.language_font_offset.x) - camx) + (sw / 2), ((starty + global.language_font_offset.y) - camy) + offy, t_create);
    draw_text(((startx + global.language_font_offset.x) - camx) + (sw / 2), ((starty + global.language_font_offset.y) - camy) + sh + offy, t_des);
}

if (position_now == UnknownEnum.Value_1)
{
    draw_sprite(s_hud_minimap_menu, 1, startx - camx, starty - camy);
    draw_sprite(s_hud_minimap_menu, 0, startx - camx, (starty - camy) + sh);
    draw_text(((startx + global.language_font_offset.x) - 1 - camx) + (sw / 2), ((starty + global.language_font_offset.y) - camy) + offy, t_create);
    draw_text(((startx + global.language_font_offset.x) - camx) + (sw / 2), ((starty + global.language_font_offset.y) - camy) + sh + offy, t_des);
}

if (position_now == UnknownEnum.Value_2)
{
    draw_sprite(s_hud_minimap_menu, 0, startx - camx, starty - camy);
    draw_sprite(s_hud_minimap_menu, 1, startx - camx, (starty - camy) + sh);
    draw_text(((startx + global.language_font_offset.x) - camx) + (sw / 2), ((starty + global.language_font_offset.y) - camy) + offy, t_create);
    draw_text(((startx + global.language_font_offset.x) - 1 - camx) + (sw / 2), ((starty + global.language_font_offset.y) - camy) + sh + offy, t_des);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
