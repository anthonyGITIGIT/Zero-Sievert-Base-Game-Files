uiAddBoxType("UiModalBack", class_ui_modal_back);

function class_ui_modal_back() : __uiClassCommon() constructor
{
    color = 16777215;
    alpha = 1;
    scale = 1;
    __sprite = s_hud_modal_background_9slice;
    VariableBind("sprite", function()
    {
        return __sprite;
    }, function(arg0)
    {
        if (is_string(arg0) && _debugStruct.__relaxedSprites)
            arg0 = asset_get_index(arg0);
        
        __sprite = arg0;
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        draw_sprite_stretched_ext(__sprite, 0, __drawLeft, __drawTop, __drawRight - __drawLeft, __drawBottom - __drawTop, _color, _alpha);
    });
}

enum UnknownEnum
{
    Value_12 = 12
}
