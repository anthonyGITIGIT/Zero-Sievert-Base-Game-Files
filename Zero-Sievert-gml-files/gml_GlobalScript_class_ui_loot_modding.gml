function class_ui_loot_modding() : __class_ui_loot_button_shared() constructor
{
    VariableBind("loot", function()
    {
        return __lootStruct;
    }, function(arg0)
    {
        __lootStruct = arg0;
        var _sprite = item_get_sprite_inv(__lootStruct.item);
        Set("ltrb", [4 * __lootStruct.x, 4 * __lootStruct.y, 4 * ((__lootStruct.x + sprite_get_width(_sprite)) - 1), 4 * ((__lootStruct.y + sprite_get_height(_sprite)) - 1)]);
    });
    CallbackSetButtonClick(function(arg0)
    {
        if (loot_weapon_mod_add(uiGetData().modding_loot, __lootStruct, uiGetData().modding_mod_pos))
            ui_modding_populate(uiGetData().modding_mod_pos);
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        if (GetButton() || GetHover())
        {
            var _borderColor = merge_color(c_orange, c_white, 0.2);
            
            if (GetButton())
                _borderColor = merge_color(_borderColor, c_white, 0.2);
            
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, GetDragging() ? __dragRotation : undefined, 4, _borderColor);
        }
        else
        {
            loot_draw(__lootStruct, __drawLeft, __drawTop, GetDragging() ? __dragRotation : undefined, 4, color, alpha);
        }
        
        if (__lootStruct.quantity > 1)
        {
            var _oldFont = draw_get_font();
            language_set_font(UnknownEnum.Value_4);
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            draw_set_color(c_black);
            draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + 16 + 4, __lootStruct.quantity);
            draw_set_color(c_white);
            draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + 16, __lootStruct.quantity);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_font_language(_oldFont);
        }
    });
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_12 = 12
}
