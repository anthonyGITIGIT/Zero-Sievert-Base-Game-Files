function class_ui_loot_debug_spawner() : __class_ui_loot_button_shared() constructor
{
    highlightTracked = true;
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
        var _item = loot_get_item(__lootStruct);
        var _quantity = item_get_stack_max(_item);
        
        if (inventory_add_item(_item, _quantity))
        {
            var _text = language_get_string("Item added to inventory");
            _text = string_replace(_text, "[ITEM_NAME]", item_get_name(_item));
            _text = string_replace(_text, "[ITEM_QUANTITY]", string(_quantity));
            scr_draw_text_with_box(_text, false);
        }
        else
        {
            scr_draw_text_with_box("Not enough inventory space!");
        }
    });
}
