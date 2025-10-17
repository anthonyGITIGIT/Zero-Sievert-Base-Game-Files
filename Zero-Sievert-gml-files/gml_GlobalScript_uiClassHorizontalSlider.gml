uiAddBoxType("UiHorizontalSlider", uiClassHorizontalSlider, false);

function uiClassHorizontalSlider() : uiClassButton() constructor
{
    static __UpdateHandle = function(arg0)
    {
        if (value == undefined || arg0)
            value = valueMin + (valueIncrement * round(((valueMax - valueMin) * handlePosition) / valueIncrement));
        else
            value = valueMin + (valueIncrement * round((value - valueMin) / valueIncrement));
        
        handlePosition = clamp((value - valueMin) / max(0.0001, valueMax - valueMin), 0, 1);
        value = clamp(value, valueMin, valueMax);
        var _height = __localBottom - __localTop;
        var _trackWidth = max(0, __localRight - __localLeft - handleWidth);
        __handleLeft = handlePosition * _trackWidth;
        __handleTop = 0.5 * (_height - handleHeight);
        __handleRight = __handleLeft + handleWidth;
        __handleBottom = 0.5 * (_height + handleHeight);
        
        if (value != undefined && value != __oldValue)
        {
            __oldValue = value;
            __CallbackGet(UnknownEnum.Value_23).__Call(self, value);
        }
    };
    
    focusable = true;
    color = 16777215;
    alpha = 1;
    scale = 1;
    handleWidth = undefined;
    handleHeight = undefined;
    handlePosition = 0;
    value = undefined;
    valueMin = 0;
    valueMax = 1;
    valueIncrement = 0.00001;
    pushIncrement = 0.05;
    __oldValue = undefined;
    __localCaptureX = 0;
    __localCaptureY = 0;
    __handleLeft = 0;
    __handleTop = 0;
    __handleRight = 0;
    __handleBottom = 0;
    VariableBind("onValueChange", function()
    {
        __uiError("Cannot get \"onValueChange\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_23, arg0);
    });
    VariableBind("valueUpdate", function()
    {
        __uiError("Cannot get \"valueUpdate\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_24, arg0);
    });
    CallbackSetButtonStart(function()
    {
        uiCallInherited();
        var _trackWidth = max(0, __localRight - __localLeft - handleWidth);
        var _handleLeft = __worldLeft + (handlePosition * _trackWidth);
        var _handleTop = (0.5 * (__localTop + __localBottom)) - (0.5 * handleHeight);
        __localCaptureX = uiPointerGetX() - _handleLeft;
        __localCaptureY = uiPointerGetY() - _handleTop;
    });
    CallbackSetCanHover(function(arg0)
    {
        if (arg0)
            return true;
        else
            return point_in_rectangle(uiPointerGetX() - __worldLeft, uiPointerGetY() - __worldTop, __handleLeft, __handleTop, __handleRight, __handleBottom);
    });
    CallbackSetButtonCanCapture(function(arg0, arg1)
    {
        if (arg1)
            return true;
        else
            return point_in_rectangle(uiPointerGetX() - __worldLeft, uiPointerGetY() - __worldTop, __handleLeft, __handleTop, __handleRight, __handleBottom);
    });
    CallbackSetButton(function(arg0, arg1)
    {
        if (obj_gamepad.action[UnknownEnum.Value_40].pressed || global.kb_pressed[UnknownEnum.Value_40])
        {
            var _struct = uiCurrentRoot();
            __uiRootStackPush(_struct);
            
            with (uiOnionCurrent())
                struct_get_from_hash(__inputButtonDict, variable_get_hash("back")).__state = false;
            
            with (_struct)
            {
                __root.__draggingRef = undefined;
                __uiNullableRefCall(__root.__captureRef, UnknownEnum.Value_6, arg0);
                __root.__captureFocus = false;
                
                with (obj_gamepad)
                {
                    reset_action(UnknownEnum.Value_40);
                    obj_gamepad.action[UnknownEnum.Value_40].pressed = false;
                }
            }
            
            __uiRootStackPop();
            exit;
        }
        
        if (!arg1)
        {
            var _trackWidth = max(1, __localRight - __localLeft - handleWidth);
            var _newLeft = uiPointerGetX();
            _newLeft -= __localCaptureX;
            _newLeft -= __worldLeft;
            handlePosition = clamp(_newLeft / _trackWidth, 0, 1);
            __UpdateHandle(true);
        }
        
        __uiHoverSet(uiCurrentRoot(), uiFindRelaxed(uiCurrentRoot(), identifier), false);
    });
    CallbackSetPush(function(arg0)
    {
        if (variable_struct_exists(__stateButtonDict, "action"))
        {
            if (arg0 == 0)
            {
                value += max(valueIncrement, pushIncrement);
                __UpdateHandle(false);
            }
            else if (arg0 == 180)
            {
                value -= max(valueIncrement, pushIncrement);
                __UpdateHandle(false);
            }
        }
    });
    CallbackSetOnClose(function()
    {
        if (handleWidth == undefined)
            handleWidth = 0.1 * (__localRight - __localLeft);
        
        if (handleHeight == undefined)
            handleHeight = __localBottom - __localTop;
        
        if (__CallbackExists(UnknownEnum.Value_24))
            value = __CallbackGet(UnknownEnum.Value_24).__Call(self) ?? value;
        
        __UpdateHandle(false);
    });
    CallbackSetDraw(function()
    {
        var _oldValue = value;
        var _newValue = __CallbackGet(UnknownEnum.Value_24).__Call(self) ?? _oldValue;
        
        if (_newValue != undefined && _newValue != _oldValue)
        {
            value = _newValue;
            __UpdateHandle(false);
        }
        
        var _sliderY = 0.5 * (__drawTop + __drawBottom);
        var _trackLeft = __drawLeft;
        var _trackRight = __drawRight;
        var _handleLeft = __handleLeft + __drawLeft;
        var _handleTop = __handleTop + __drawTop;
        var _handleRight = __handleRight + __drawLeft;
        var _handleBottom = __handleBottom + __drawTop;
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        
        if (_handleLeft > _trackLeft)
            draw_line(_trackLeft, _sliderY, _handleLeft, _sliderY);
        
        if (_trackRight > _handleRight)
            draw_line(_handleRight, _sliderY, _trackRight, _sliderY);
        
        draw_set_color(c_black);
        draw_set_alpha(1);
        draw_rectangle(_handleLeft, _handleTop, _handleRight, _handleBottom, false);
        draw_set_color(_color);
        
        if (GetButton())
        {
            draw_set_alpha(0.5 * _alpha);
            draw_rectangle(_handleLeft, _handleTop, _handleRight, _handleBottom, false);
        }
        else if (GetHover())
        {
            draw_set_alpha(0.25 * _alpha);
            draw_rectangle(_handleLeft, _handleTop, _handleRight, _handleBottom, false);
        }
        
        if (_alpha > 0)
        {
            draw_set_alpha(_alpha);
            draw_rectangle(_handleLeft, _handleTop, _handleRight, _handleBottom, true);
        }
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
    });
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_23 = 23,
    Value_24,
    Value_40 = 40
}
