uiAddBoxType("UiVerticalSlider", uiClassVerticalSlider, false);

function uiClassVerticalSlider() : uiClassButton() constructor
{
    static __UpdateHandle = function(arg0)
    {
        if (value == undefined || arg0)
            value = valueMin + (valueIncrement * round(((valueMax - valueMin) * handlePosition) / valueIncrement));
        else
            value = valueMin + (valueIncrement * round((value - valueMin) / valueIncrement));
        
        value = clamp(value, valueMin, valueMax);
        handlePosition = clamp((value - valueMin) / (valueMax - valueMin), 0, 1);
        var _width = __localRight - __localLeft;
        var _trackHeight = max(0, __localBottom - __localTop - handleHeight);
        __handleLeft = 0.5 * (_width - handleWidth);
        __handleTop = handlePosition * _trackHeight;
        __handleRight = 0.5 * (_width + handleWidth);
        __handleBottom = __handleTop + handleHeight;
        
        if (value != undefined && value != __oldValue)
        {
            __oldValue = value;
            __CallbackGet(UnknownEnum.Value_23).__Call(self, value);
        }
    };
    
    focusable = true;
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
        var _trackHeight = max(0, __localBottom - __localTop - handleHeight);
        var _handleLeft = (0.5 * (__localLeft + __localRight)) - (0.5 * handleWidth);
        var _handleTop = __worldTop + (handlePosition * _trackHeight);
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
        if (!arg1)
        {
            var _trackHeight = max(1, __localBottom - __localTop - handleHeight);
            var _newTop = uiPointerGetY();
            _newTop -= __localCaptureY;
            _newTop -= __worldTop;
            handlePosition = clamp(_newTop / _trackHeight, 0, 1);
            __UpdateHandle(true);
        }
    });
    CallbackSetPush(function(arg0)
    {
        if (arg0 == 270)
        {
            value += max(valueIncrement, pushIncrement);
            __UpdateHandle(false);
        }
        else if (arg0 == 90)
        {
            value -= max(valueIncrement, pushIncrement);
            __UpdateHandle(false);
        }
    });
    CallbackSetOnClose(function()
    {
        if (handleWidth == undefined)
            handleWidth = __localRight - __localLeft;
        
        if (handleHeight == undefined)
            handleHeight = 0.1 * (__localBottom - __localTop);
        
        if (__CallbackExists(UnknownEnum.Value_24))
            value = __CallbackGet(UnknownEnum.Value_24).__Call(self) ?? value;
        
        __UpdateHandle(false);
    });
    CallbackSetDraw(function()
    {
        var _oldValue = value;
        var _newValue = __CallbackGet(UnknownEnum.Value_24).__Call(self) ?? _oldValue;
        
        if (_newValue != _oldValue)
        {
            value = _newValue;
            __UpdateHandle(false);
        }
        
        var _sliderX = 0.5 * (__drawLeft + __drawRight);
        var _trackTop = __drawTop;
        var _trackBottom = __drawBottom;
        var _handleLeft = __handleLeft + __drawLeft;
        var _handleTop = __handleTop + __drawTop;
        var _handleRight = __handleRight + __drawLeft;
        var _handleBottom = __handleBottom + __drawTop;
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        draw_set_color(color);
        draw_set_alpha(alpha);
        
        if (_handleTop > _trackTop)
            draw_line(_sliderX, _trackTop, _sliderX, _handleTop);
        
        if (_trackBottom > _handleBottom)
            draw_line(_sliderX, _handleBottom, _sliderX, _trackBottom);
        
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
    Value_23 = 23,
    Value_24
}
