function class_ui_loot_preview() : __class_ui_loot_button_shared() constructor
{
    highlightTracked = false;
    VariableBind("loot", function()
    {
        return __lootStruct;
    }, function(arg0)
    {
        __lootStruct = arg0;
        var _sprite = item_get_sprite_inv(__lootStruct.item);
        
        if (__lootStruct.rotation == 0)
            Set("ltrb", [4 * __lootStruct.x, 4 * __lootStruct.y, 4 * ((__lootStruct.x + sprite_get_width(_sprite)) - 1), 4 * ((__lootStruct.y + sprite_get_height(_sprite)) - 1)]);
        else
            Set("ltrb", [4 * __lootStruct.x, 4 * __lootStruct.y, 4 * ((__lootStruct.x + sprite_get_height(_sprite)) - 1), 4 * ((__lootStruct.y + sprite_get_width(_sprite)) - 1)]);
    });
}
