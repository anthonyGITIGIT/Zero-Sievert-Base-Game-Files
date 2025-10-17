function class_ui_loot_trader() : __class_ui_loot_button_shared() constructor
{
    static CanBuy = function()
    {
        return faction_get_rep("Player", uiGetData().trader_target.faction) >= __lootStruct.min_level;
    };
    
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
        switch (Get("parent").identifier)
        {
            case "other inventory":
                if (!CanBuy())
                {
                    var _text = language_get_string("Unlocked at reputation level ?");
                    scr_draw_text_with_box(string_replace(_text, "[LOOT_LEVEL]", string(__lootStruct.min_level)), false);
                }
                else
                {
                    var _new_loot = SnapDeepCopy(__lootStruct);
                    
                    if (keyboard_check(vk_control))
                        _new_loot.quantity = 1;
                    else if (item_get_stack_max(__lootStruct.item) < 10)
                        _new_loot.quantity = 1;
                    else
                        _new_loot.quantity = min(round(item_get_stack_max(__lootStruct.item) * 0.5), _new_loot.quantity);
                    
                    if (ui_inventory_add_loot(_new_loot, "buy inventory", class_ui_loot_trader, false))
                        trader_inventory_subtract(uiGetData().trader_target, __lootStruct.item, _new_loot.quantity);
                }
                
                break;
            
            case "buy inventory":
                if (!obj_gamepad.last_input_keyboard)
                {
                    var _root = uiLayerGetRoot("inventory layer");
                    var _destination = uiFind(_root, "buy inventory");
                    var _buy_array = _destination.__children;
                    var _i = 0;
                    
                    repeat (array_length(_buy_array))
                    {
                        var _child = _buy_array[_i++];
                        
                        if (_child != self)
                        {
                            __uiHoverSet(uiCurrentRoot(), _child, false);
                            break;
                        }
                    }
                }
                
                trader_inventory_add(uiGetData().trader_target, __lootStruct.item, __lootStruct.quantity, __lootStruct.min_level);
                uiDestroy(self);
                break;
            
            default:
                trace_error("Trader inventory button placed on wrong parent \"", Get("parent").identifier, "\"");
                break;
        }
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _hoverColour = color;
        var _hoverStruct = GetHoverStruct();
        var _rotation = GetDragging() ? __dragRotation : undefined;
        var _compatHighlight = false;
        
        if (_hoverStruct != self && is_struct(_hoverStruct))
        {
            if (_hoverStruct.GetType() == "class_ui_item" || _hoverStruct.GetType() == "class_ui_loot_trader")
                _compatHighlight = item_is_compatible(loot_get_item(__lootStruct), loot_get_item(_hoverStruct.__lootStruct));
        }
        
        if (GetButton() || GetHover())
        {
            _hoverColour = merge_color(c_orange, c_white, 0.2);
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _hoverColour);
        }
        else if (!CanBuy())
        {
            _hoverColour = 8355839;
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _hoverColour);
        }
        else if (_compatHighlight)
        {
            _hoverColour = 65280;
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _hoverColour);
        }
        else if (item_is_tracked(loot_get_item(__lootStruct)))
        {
            _hoverColour = 6477526;
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _hoverColour);
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
            draw_set_color(_hoverColour);
            draw_text(__drawRight + global.language_font_offset.x, __drawBottom + global.language_font_offset.y + 16, __lootStruct.quantity);
            draw_set_color(c_white);
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
