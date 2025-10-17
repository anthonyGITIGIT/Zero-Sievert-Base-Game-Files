draw_self();
var i = 0;
language_set_font(UnknownEnum.Value_0);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var _name_node_now = global.node_name[tree_id[node_running_now]];
draw_text(x + global.language_font_offset.x, (y + global.language_font_offset.y) - 24 - (14 * i), _name_node_now);

enum UnknownEnum
{
    Value_0
}
