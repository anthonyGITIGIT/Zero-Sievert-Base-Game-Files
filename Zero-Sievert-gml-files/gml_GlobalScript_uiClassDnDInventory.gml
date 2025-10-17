function uiClassDnDInventory() : uiClassDnDTarget() constructor
{
    static __UpdateSize = function()
    {
        Set("size", [__cellWidth * __cellCountX, __cellHeight * __cellCountY]);
    };
    
    static FindEmptyPlace = function(arg0, arg1 = false, arg2 = false)
    {
        if (arg0 == undefined)
            exit;
        
        var _moving_loot_struct = arg0.__lootStruct;
        
        if (arg1)
        {
            var _root = uiLayerGetRoot("inventory layer");
            var _loot_array = uiFindAllType(_root, "class_ui_item");
            var _i = 0;
            
            repeat (array_length(_loot_array))
            {
                var _loot = _loot_array[_i].__lootStruct;
                
                if (!loot_in_primary_weapon_slot(_loot) && !loot_in_secondary_weapon_slot(_loot))
                {
                    if (!variable_struct_exists(_loot, "placement"))
                        break;
                    
                    if (identifier == _loot.placement)
                    {
                        if (_moving_loot_struct.item == _loot.item)
                        {
                            if (_loot.quantity != item_get_stack_max(_loot.item) && _loot.quantity > 0)
                            {
                                var _change = _loot.quantity + _moving_loot_struct.quantity;
                                var _decrement;
                                
                                if (_change >= item_get_stack_max(_loot.item))
                                {
                                    _decrement = item_get_stack_max(_loot.item) - _loot.quantity;
                                    _loot.quantity = item_get_stack_max(_loot.item);
                                }
                                else
                                {
                                    _decrement = _moving_loot_struct.quantity;
                                    _loot.quantity += _moving_loot_struct.quantity;
                                }
                                
                                var _loot_return = loot_decrement(_moving_loot_struct, _decrement);
                                ui_inventory_check_weight();
                                
                                if (!_loot_return)
                                    return true;
                            }
                        }
                    }
                }
                
                _i++;
            }
        }
        
        var _draggingWidth = arg0.Get("width");
        var _draggingHeight = arg0.Get("height");
        var _targetCellWidth = 1 + floor(_draggingWidth / __cellWidth);
        var _targetCellHeight = 1 + floor(_draggingHeight / __cellHeight);
        var _targetPxWidth = _targetCellWidth * __cellWidth;
        var _targetPxHeight = _targetCellHeight * __cellHeight;
        var _y = 0;
        
        repeat ((1 + __cellCountY) - _targetCellHeight)
        {
            var _qTop = _y * __cellHeight;
            var _qBottom = _qTop + _targetPxHeight;
            var _x = 0;
            
            repeat ((1 + __cellCountX) - _targetCellWidth)
            {
                var _qLeft = _x * __cellWidth;
                var _qRight = _qLeft + _targetPxWidth;
                
                if (RectangleCollidesWithChildren(_qLeft, _qTop, _qRight, _qBottom, arg0, overlapTolerance) == undefined)
                    return [0.5 * (_qLeft + _qRight), 0.5 * (_qTop + _qBottom), 0];
                
                _x++;
            }
            
            _y++;
        }
        
        if (arg2)
        {
            _y = 0;
            
            repeat ((1 + __cellCountY) - _targetCellWidth)
            {
                var _qTop = _y * __cellHeight;
                var _qBottom = _qTop + _targetPxWidth;
                var _x = 0;
                
                repeat ((1 + __cellCountX) - _targetCellHeight)
                {
                    var _qLeft = _x * __cellWidth;
                    var _qRight = _qLeft + _targetPxHeight;
                    
                    if (RectangleCollidesWithChildren(_qLeft, _qTop, _qRight, _qBottom, arg0, overlapTolerance) == undefined)
                        return [0.5 * (_qLeft + _qRight), 0.5 * (_qTop + _qBottom), 1];
                    
                    _x++;
                }
                
                _y++;
            }
        }
        
        return undefined;
    };
    
    static __HandleDnD = function(arg0, arg1)
    {
        __highlightLeft = 0;
        __highlightTop = 0;
        __highlightRight = 0;
        __highlightBottom = 0;
        __highlightCollision = false;
        var _pointerX = uiPointerGetX() - uiPointerGetCaptureX() - __worldLeft;
        var _pointerY = uiPointerGetY() - uiPointerGetCaptureY() - __worldTop;
        
        if (_pointerX < 0 || _pointerY < 0 || _pointerX > (__localRight - __localLeft) || _pointerY > (__localBottom - __localTop))
            return undefined;
        
        var _draggingWidth = arg0.Get("width");
        var _draggingHeight = arg0.Get("height");
        var _left = _pointerX - (0.5 * _draggingWidth);
        var _top = _pointerY - (0.5 * _draggingHeight);
        var _qLeft = round(_left / __cellWidth);
        var _qTop = round(_top / __cellHeight);
        var _qWidth = 1 + floor(_draggingWidth / __cellWidth);
        var _qHeight = 1 + floor(_draggingHeight / __cellHeight);
        _qLeft = clamp(_qLeft, 0, __cellCountX - _qWidth);
        _qTop = clamp(_qTop, 0, __cellCountY - _qHeight);
        var _qRight = _qLeft + _qWidth;
        var _qBottom = _qTop + _qHeight;
        _qLeft *= __cellWidth;
        _qTop *= __cellHeight;
        _qRight *= __cellWidth;
        _qBottom *= __cellHeight;
        __highlightCollision = RectangleCollidesWithChildren(_qLeft, _qTop, _qRight, _qBottom, arg0, overlapTolerance) != undefined;
        
        if (arg1 || !__highlightCollision)
        {
            __highlightLeft = _qLeft;
            __highlightTop = _qTop;
            __highlightRight = _qRight;
            __highlightBottom = _qBottom;
            return 
            {
                x: 0.5 * (_qLeft + _qRight),
                y: 0.5 * (_qTop + _qBottom)
            };
        }
        else
        {
            return undefined;
        }
    };
    
    centreOnHover = false;
    color = 16777215;
    scale = 1;
    alpha = 1;
    overlapTolerance = 3;
    showGridLines = true;
    __cellWidth = 16;
    __cellHeight = 16;
    __cellCountX = 6;
    __cellCountY = 8;
    __highlightLeft = 0;
    __highlightTop = 0;
    __highlightRight = 0;
    __highlightBottom = 0;
    __highlightCollision = false;
    __UpdateSize();
    VariableBind("cellWidth", function()
    {
        return __cellWidth;
    }, function(arg0)
    {
        __cellWidth = arg0;
        __UpdateSize();
    });
    VariableBind("cellHeight", function()
    {
        return __cellHeight;
    }, function(arg0)
    {
        __cellHeight = arg0;
        __UpdateSize();
    });
    VariableBind("cellCountX", function()
    {
        return __cellCountX;
    }, function(arg0)
    {
        __cellCountX = arg0;
        __UpdateSize();
    });
    VariableBind("cellCountY", function()
    {
        return __cellCountY;
    }, function(arg0)
    {
        __cellCountY = arg0;
        __UpdateSize();
    });
    CallbackSetDnDCanReceive(function(arg0)
    {
        return __HandleDnD(arg0, true) != undefined;
    });
    CallbackSetDnDOnReceive(function(arg0)
    {
        var _data = __HandleDnD(arg0, false);
        
        if (_data == undefined)
            exit;
        
        arg0.ParentChange(self);
        arg0.Set("x", _data.__x);
        arg0.Set("y", _data.__y);
    });
    CallbackSetStep(function()
    {
        if (!GetAnyDragging())
        {
            __highlightLeft = 0;
            __highlightTop = 0;
            __highlightRight = 0;
            __highlightBottom = 0;
        }
    });
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _scale = scale * animScale;
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        draw_set_color(c_black);
        draw_set_alpha(_alpha);
        draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        draw_set_color(_color);
        draw_set_alpha(_alpha);
        draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true);
        draw_set_color(__highlightCollision ? c_red : c_white);
        draw_set_alpha(0.3 * _alpha);
        draw_rectangle(__drawLeft + __highlightLeft, __drawTop + __highlightTop, __drawLeft + __highlightRight, __drawTop + __highlightBottom, false);
        draw_set_color(_color);
        
        if (showGridLines)
        {
            draw_set_alpha(_alpha);
            var _x = __drawLeft + __cellWidth;
            
            repeat (__cellCountX - 1)
            {
                draw_line(_x, __drawTop, _x, __drawBottom);
                _x += __cellWidth;
            }
            
            var _y = __drawTop + __cellHeight;
            
            repeat (__cellCountY - 1)
            {
                draw_line(__drawLeft, _y, __drawRight, _y);
                _y += __cellHeight;
            }
        }
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
    });
}
