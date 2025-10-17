function class_ui_loot_reward() : __class_ui_loot_button_shared() constructor
{
    highlightTracked = true;
    highlightReward = true;
    __is_reward = true;
    VariableBind("loot", function()
    {
        return __lootStruct;
    }, function(arg0)
    {
        __lootStruct = arg0;
        var _sprite = item_get_sprite_inv(__lootStruct.item);
        Set("size", [4 * (sprite_get_width(_sprite) - 1), 4 * (sprite_get_height(_sprite) - 1)]);
    });
    CallbackSetButtonClick(function(arg0)
    {
        uiGetData().reward_item = __lootStruct.item;
        uiGetData().reward_item_quantity = __lootStruct.quantity;
    });
}
