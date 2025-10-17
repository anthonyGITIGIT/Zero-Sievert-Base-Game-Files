function __class_ui_loot_button_shared() : uiClassButton() constructor
{
    static __SetRotatedSize = function(arg0)
    {
        var _sprite = item_get_sprite_inv(__lootStruct.item);
        var _width = 4 * (sprite_get_width(_sprite) - 1);
        var _height = 4 * (sprite_get_height(_sprite) - 1);
        
        if (arg0 == 0)
        {
            Set("width", _width);
            Set("height", _height);
        }
        else
        {
            Set("width", _height);
            Set("height", _width);
        }
    };
    
    static AutoPlace = function(arg0)
    {
        var _position = arg0.FindEmptyPlace(self);
        
        if (_position == undefined)
        {
            Destroy();
            return false;
        }
        
        ParentChange(arg0);
        Set("x", _position[0]);
        Set("y", _position[1]);
        Set("rotation", _position[2]);
        ui_inventory_check_weight();
        return true;
    };
    
    highlightTracked = false;
    highlightReward = false;
    __is_reward = false;
    __lootStruct = undefined;
    __tooltipTimer = 20;
    Set("captureClick", "action");
    CallbackSetHover(function()
    {
        uiCallInherited();
        
        if (__tooltipTimer > 0)
        {
            __tooltipTimer--;
        }
        else if (!GetButton("action"))
        {
            if (!obj_gamepad.last_input_keyboard && obj_gamepad.action[UnknownEnum.Value_32].decimal > 0)
            {
                uiGetData().tooltip_loot = __lootStruct;
                
                if (!is_undefined(uiOnionCurrent()))
                    uiOnionCurrent().TooltipEnsureOver("ZS_vanilla/ui/tooltip_item.ui", "tooltip", uiOnionCurrentLayer());
            }
            else if (!!obj_gamepad.last_input_keyboard)
            {
                uiGetData().tooltip_loot = __lootStruct;
                
                if (!is_undefined(uiOnionCurrent()))
                    uiOnionCurrent().TooltipEnsureOver("ZS_vanilla/ui/tooltip_item.ui", "tooltip", uiOnionCurrentLayer());
            }
        }
    });
    CallbackSetHoverEnd(function()
    {
        uiCallInherited();
        __tooltipTimer = 20;
    });
    CallbackSetButtonClick(function(arg0)
    {
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _rotation = GetDragging() ? __dragRotation : undefined;
        
        if (GetButton() || GetHover())
        {
            var _borderColor = merge_color(c_orange, c_white, 0.2);
            
            if (GetButton())
                _borderColor = merge_color(_borderColor, c_white, 0.2);
            
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _borderColor);
        }
        else if (highlightTracked && item_is_tracked(loot_get_item(__lootStruct)))
        {
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, 3211263);
        }
        else if (uiGetData().reward_item == __lootStruct.item && highlightReward && npc_dialogue_get_quest_state_current_is_completed())
        {
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, 65280);
        }
        else
        {
            loot_draw(__lootStruct, __drawLeft, __drawTop, _rotation, 4, color, alpha);
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
    Value_12 = 12,
    Value_32 = 32
}
