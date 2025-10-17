uiAddBoxType("UiItemSlot", class_ui_item_slot);

function class_ui_item_slot() : uiClassDnDTarget() constructor
{
    static AutoPlace = function(arg0)
    {
        if (!HasChildren())
        {
            arg0.ParentChange(self);
            arg0.Set("x", (__localRight - __localLeft) * 0.5);
            arg0.Set("y", (__localBottom - __localTop) * 0.5);
            arg0.__lootStruct.placement = identifier;
            return true;
        }
        
        return false;
    };
    
    static __CanReceiveDrag = function()
    {
        if (!GetAnyDragging())
            return false;
        
        if (HasChildren())
        {
            if (__children[0] != GetDraggedStruct())
                return false;
        }
        
        var _item_category = item_get_category(GetDraggedStruct().__lootStruct.item);
        
        if (is_array(category))
        {
            var _i = 0;
            
            repeat (array_length(category))
            {
                if (_item_category == category[_i])
                    return true;
                
                _i++;
            }
            
            return false;
        }
        else
        {
            return _item_category == category;
        }
    };
    
    category = undefined;
    CallbackSetCanHover(function(arg0)
    {
        return __CanReceiveDrag();
    });
    CallbackSetDnDCanReceive(function(arg0)
    {
        return __CanReceiveDrag();
    });
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _scale = scale * animScale;
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        
        if (GetHover())
        {
            draw_set_color(_color);
            draw_set_alpha(0.5 * _alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        }
        else if (__CanReceiveDrag())
        {
            draw_set_color(_color);
            draw_set_alpha(0.25 * _alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        }
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
    });
}
