function class_ui_loot_crafting_requirement() : __class_ui_loot_button_shared() constructor
{
    __fulfilled = false;
    VariableBind("loot", function()
    {
        return __lootStruct;
    }, function(arg0)
    {
        __lootStruct = arg0;
        __fulfilled = inventory_and_stash_get_total_of_item(__lootStruct.item) >= __lootStruct.quantity;
        var _sprite = item_get_sprite_inv(__lootStruct.item);
        Set("ltrb", [4 * __lootStruct.x, 4 * __lootStruct.y, 4 * ((__lootStruct.x + sprite_get_width(_sprite)) - 1), 4 * ((__lootStruct.y + sprite_get_height(_sprite)) - 1)]);
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        if (GetButton() || GetHover())
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, GetDragging() ? __dragRotation : undefined, 4, merge_color(c_orange, c_white, 0.2));
        else if (!__fulfilled)
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, GetDragging() ? __dragRotation : undefined, 4, 8355839);
        else
            loot_draw(__lootStruct, __drawLeft, __drawTop, GetDragging() ? __dragRotation : undefined, 4, color, alpha);
    });
    CallbackSet(UnknownEnum.Value_13, function()
    {
        if (__lootStruct.quantity > 1)
        {
            var _oldFont = draw_get_font();
            language_set_font(UnknownEnum.Value_4);
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            var _total_amount = inventory_and_stash_get_total_of_item(__lootStruct.item);
            var _color = __fulfilled ? 9688723 : 16777215;
            draw_set_color(c_black);
            draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + 16 + 4, _total_amount);
            draw_set_color(_color);
            draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + 16, _total_amount);
            var _font_height = string_height("M") * 0.6;
            draw_set_color(c_white);
            draw_line((__drawRight + global.language_font_offset.x) - max(string_width(__lootStruct.quantity), string_width(_total_amount)) - 5, (__drawBottom + global.language_font_offset.y) - 1, __drawRight + global.language_font_offset.x + 2, (__drawBottom + global.language_font_offset.y) - 1);
            draw_line((__drawRight + global.language_font_offset.x) - max(string_width(__lootStruct.quantity), string_width(_total_amount)) - 5, __drawBottom + global.language_font_offset.y + 0, __drawRight + global.language_font_offset.x + 2, __drawBottom + global.language_font_offset.y + 0);
            draw_set_color(c_black);
            draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + _font_height + 16 + 4, __lootStruct.quantity);
            draw_set_color(c_white);
            draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + _font_height + 16, __lootStruct.quantity);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_font_language(_oldFont);
            draw_set_color(c_white);
        }
    });
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_12 = 12,
    Value_13
}
