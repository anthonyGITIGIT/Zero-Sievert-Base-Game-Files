uiAddBoxType("UiScrollBoxMap", uiClassScrollBoxMap, false);

function uiClassScrollBoxMap() : __uiClassCommon() constructor
{
    static __ScrollTo = function(arg0)
    {
        var _oldScrollX = scrollX;
        var _oldScrollY = scrollY;
        var _width = Get("width");
        var _height = Get("height");
        var _targetLeft = arg0.__localLeft;
        var _targetTop = arg0.__localTop;
        var _targetRight = arg0.__localRight;
        var _targetBottom = arg0.__localBottom;
        var __worldScale = 1;
        var __localScale = 1;
        
        if (!!obj_gamepad.last_input_keyboard)
        {
            if (_targetLeft < 0)
            {
                if (_targetRight < _width)
                    scrollX = _targetLeft / __worldScale;
                else
                    scrollX = ((_width / 2) - (_targetLeft / 2)) / __worldScale;
            }
            else if (_targetRight > _width)
            {
                scrollX = (_targetRight - _width) / __worldScale;
            }
            else
            {
            }
            
            if (_targetTop < 0)
            {
                if (_targetBottom < _height)
                    scrollY = _targetTop / __worldScale;
                else
                    scrollY = ((_height / 2) - (_targetTop / 2)) / __worldScale;
            }
            else if (_targetBottom > _height)
            {
                scrollY = (_targetBottom - _height) / __worldScale;
            }
            else
            {
            }
        }
        
        scrollX = clamp(scrollX, scrollXMin, scrollXMax);
        scrollY = clamp(scrollY, scrollYMin, scrollYMax);
        
        if (_oldScrollX != scrollX || _oldScrollY != scrollY)
            __Step(__worldOffsetX, __worldOffsetY, __worldScale / __localScale, false);
        
        __ScrollParentToSelf();
    };
    
    static __DestroyInner = function()
    {
        if (__destroyed)
            exit;
        
        __destroyed = true;
        
        if (surface_exists(__surface))
            surface_free(__surface);
        
        Set("active", false);
        Set("visible", false);
        var _i = 0;
        
        repeat (array_length(__children))
        {
            __children[_i].__DestroyInner();
            _i++;
        }
    };
    
    static __EnsureSurface = function()
    {
        var _new = false;
        
        if (!surface_exists(__surface))
        {
            _new = true;
        }
        else if (surface_get_width(__surface) != (__localRight - __localLeft) || surface_get_height(__surface) != (__localBottom - __localTop))
        {
            surface_free(__surface);
            _new = true;
        }
        
        if (_new)
            __surface = __uiSurfaceCreate(self, __localRight - __localLeft, __localBottom - __localTop);
    };
    
    static __Step = function(arg0, arg1, arg2)
    {
        __uiContextStackPush(self);
        
        if (arg2 && __animMode == 1)
        {
            __animTime++;
            __CallbackGet(UnknownEnum.Value_25).__Call(self, __animTime);
            
            if (__animTime >= buildInLength)
                BuildFinish();
        }
        
        arg0 += animXOffset;
        arg1 += animYOffset;
        __worldOffsetX = arg0;
        __worldOffsetY = arg1;
        __worldLeft = arg0 + __localLeft;
        __worldTop = arg1 + __localTop;
        __worldRight = arg0 + __localRight;
        __worldBottom = arg1 + __localBottom;
        
        if (arg2 && __active)
            __CallbackGet(UnknownEnum.Value_11).__Call(self);
        
        var _i = 0;
        
        repeat (array_length(__children))
        {
            var _child = __children[_i];
            
            if (_child.__destroyed)
            {
                array_delete(__children, _i, 1);
            }
            else
            {
                _child.__Step(__worldLeft - scrollX, __worldTop - scrollY, arg2);
                _i++;
            }
        }
        
        if (!obj_gamepad.last_input_keyboard)
        {
            if (obj_gamepad.action[UnknownEnum.Value_38].value)
                scrollX += 10;
            
            if (obj_gamepad.action[UnknownEnum.Value_37].value)
                scrollX -= 10;
            
            if (obj_gamepad.action[UnknownEnum.Value_36].value)
                scrollY += 10;
            
            if (obj_gamepad.action[UnknownEnum.Value_35].value)
                scrollY -= 10;
            
            scrollX = clamp(scrollX, scrollXMin, scrollXMax);
            scrollY = clamp(scrollY, scrollYMin, scrollYMax);
        }
        
        __uiContextStackPop();
    };
    
    static __Draw = function(arg0, arg1, arg2)
    {
        if (__stateDragging && !arg2)
            exit;
        
        __uiContextStackPush(self);
        arg0 += animXOffset;
        arg1 += animYOffset;
        
        if (__stateDragging)
        {
            arg0 = __dragOffsetX;
            arg1 = __dragOffsetY;
        }
        
        __drawOffsetX = arg0;
        __drawOffsetY = arg1;
        __drawLeft = arg0 + __localLeft;
        __drawTop = arg1 + __localTop;
        __drawRight = arg0 + __localRight;
        __drawBottom = arg1 + __localBottom;
        
        if (_debugStruct.__showSkeleton)
        {
            var _oldColor = draw_get_color();
            var _oldAlpha = draw_get_alpha();
            draw_set_color(c_white);
            draw_set_alpha(1);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true);
            draw_set_color(_oldColor);
            draw_set_alpha(_oldAlpha);
        }
        
        if (__visible)
            __CallbackGet(UnknownEnum.Value_12).__Call(self);
        
        __EnsureSurface();
        surface_set_target(__surface);
        draw_clear_alpha(c_black, 0);
        var _i = 0;
        
        repeat (array_length(__children))
        {
            var _child = __children[_i];
            
            if (_child.__destroyed)
            {
                array_delete(__children, _i, 1);
            }
            else
            {
                _child.__Draw(-scrollX, -scrollY, arg2);
                _i++;
            }
        }
        
        if (_debugStruct.__showNavigationGraph)
        {
            var _oldColor = draw_get_color();
            _i = 0;
            
            repeat (array_length(__children))
            {
                with (__children[_i])
                {
                    if (__uiNullableRefAlive(__navigationRight))
                    {
                        draw_set_color(c_red);
                        var _target = __uiNullableRefResolve(__navigationRight);
                        draw_arrow(0.5 * (__drawLeft + __drawRight), (0.5 * (__drawTop + __drawBottom)) - 4, 0.5 * (_target.__drawLeft + _target.__drawRight), (0.5 * (_target.__drawTop + _target.__drawBottom)) - 4, 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationUp))
                    {
                        draw_set_color(c_lime);
                        var _target = __uiNullableRefResolve(__navigationUp);
                        draw_arrow((0.5 * (__drawLeft + __drawRight)) - 4, 0.5 * (__drawTop + __drawBottom), (0.5 * (_target.__drawLeft + _target.__drawRight)) - 4, 0.5 * (_target.__drawTop + _target.__drawBottom), 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationLeft))
                    {
                        draw_set_color(c_aqua);
                        var _target = __uiNullableRefResolve(__navigationLeft);
                        draw_arrow(0.5 * (__drawLeft + __drawRight), (0.5 * (__drawTop + __drawBottom)) + 4, 0.5 * (_target.__drawLeft + _target.__drawRight), (0.5 * (_target.__drawTop + _target.__drawBottom)) + 4, 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationDown))
                    {
                        draw_set_color(c_fuchsia);
                        var _target = __uiNullableRefResolve(__navigationDown);
                        draw_arrow((0.5 * (__drawLeft + __drawRight)) + 4, 0.5 * (__drawTop + __drawBottom), (0.5 * (_target.__drawLeft + _target.__drawRight)) + 4, 0.5 * (_target.__drawTop + _target.__drawBottom), 10);
                    }
                }
                
                _i++;
            }
            
            draw_set_color(_oldColor);
        }
        
        surface_reset_target();
        draw_surface(__surface, __drawLeft, __drawTop);
        __uiContextStackPop();
    };
    
    scrollX = 0;
    scrollXMin = 0;
    scrollXMax = 0;
    scrollY = 0;
    scrollYMin = 0;
    scrollYMax = 0;
    draggableX = false;
    draggableY = false;
    __captureClipChildren = true;
    __surface = -1;
    __scrollDragOffsetX = 0;
    __scrollDragOffsetY = 0;
    CallbackSetHoverStart(function()
    {
        uiCallInherited();
    });
    CallbackSetButtonStart(function()
    {
        uiCallInherited();
        
        if (draggableX || draggableY)
        {
            __scrollDragOffsetX = scrollX;
            __scrollDragOffsetY = scrollY;
        }
    });
    CallbackSetButton(function()
    {
        uiCallInherited();
        
        if (draggableX)
            scrollX = clamp(-(uiPointerGetX() - uiPointerGetStartX()) + __scrollDragOffsetX, scrollXMin, scrollXMax);
        
        if (draggableY)
            scrollY = clamp(-(uiPointerGetY() - uiPointerGetStartY()) + __scrollDragOffsetY, scrollYMin, scrollYMax);
    });
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_12,
    Value_25 = 25,
    Value_35 = 35,
    Value_36,
    Value_37,
    Value_38
}
