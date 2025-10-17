uiAddBoxType("UiHorizontalSlider", class_ui_horizontal_slider);

function class_ui_horizontal_slider() : uiClassHorizontalSlider() constructor
{
    CallbackSet(UnknownEnum.Value_14, function()
    {
        handleWidth = 24;
        handleHeight = 60;
        uiCallInherited();
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _oldValue = value;
        var _newValue = __CallbackExists(UnknownEnum.Value_24) ? __CallbackGet(UnknownEnum.Value_24).__Call(self) : undefined;
        
        if (_newValue != undefined && _newValue != _oldValue)
        {
            value = _newValue;
            __UpdateHandle(false);
        }
        
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        var _handleLeft = __handleLeft + __drawLeft;
        var _handleTop = __handleTop + __drawTop;
        var _handleRight = __handleRight + __drawLeft;
        var _handleBottom = __handleBottom + __drawTop;
        var _handleX = 0.5 * (_handleLeft + _handleRight);
        var _handleY = 0.5 * (_handleTop + _handleBottom);
        var _selected = (GetHover() && !uiPointerIsDirectional()) || GetButton();
        
        if (uiPointerIsDirectional() && GetHover())
        {
            if (GetButton())
                draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thin, 0, __drawLeft - 10, __drawTop - 10, (20 + __drawRight) - __drawLeft, (20 + __drawBottom) - __drawTop, _selected ? #CCC932 : _color, _alpha);
            else
                draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thin, 0, __drawLeft - 14, __drawTop - 14, (28 + __drawRight) - __drawLeft, (28 + __drawBottom) - __drawTop, _selected ? #CCC932 : _color, _alpha);
        }
        
        draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thick, 0, __drawLeft, __drawTop, __drawRight - __drawLeft, __drawBottom - __drawTop, _selected ? #CCC932 : _color, _alpha);
        draw_sprite_ext(s_hud_slider_point, _selected, _handleX, _handleY, 4, 4, 0, _selected ? #FFFC40 : _color, _alpha);
    });
}

enum UnknownEnum
{
    Value_12 = 12,
    Value_14 = 14,
    Value_24 = 24
}
