function class_ui_loot_crafting_go_to_modding() : __class_ui_loot_button_shared() constructor
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
        crafting_go_to_modding(__lootStruct);
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        if (GetButton() || GetHover())
        {
            var _borderColor = merge_color(c_orange, c_white, 0.2);
            
            if (GetButton())
                _borderColor = merge_color(_borderColor, c_white, 0.2);
            
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, 0, 4, _borderColor);
        }
        else
        {
            loot_draw(__lootStruct, __drawLeft, __drawTop, 0, 4, color, alpha);
        }
    });
}

enum UnknownEnum
{
    Value_12 = 12
}
