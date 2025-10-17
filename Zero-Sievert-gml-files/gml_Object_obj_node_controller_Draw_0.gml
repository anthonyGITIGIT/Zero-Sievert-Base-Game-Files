if (over_node_id != -4)
{
    var _node_id = over_node_id.my_id;
    var _name = global.node_name[_node_id];
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(over_node_id.x + global.language_font_offset.x, (over_node_id.y + global.language_font_offset.y) - 16, _name);
}

with (__uiGlobal().__defaultOnion)
{
    if (InputGetMode() == "directional")
        exit;
}

draw_sprite(s_mouse, 4, obj_cursor.aa_x, obj_cursor.aa_y);

enum UnknownEnum
{
    Value_0
}
