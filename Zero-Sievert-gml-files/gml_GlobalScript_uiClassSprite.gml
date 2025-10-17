uiAddBoxType("UiSprite", uiClassSprite, false);

function uiClassSprite() : __uiClassCommon() constructor
{
    color = 16777215;
    scale = 1;
    alpha = 1;
    image = 0;
    stretch = false;
    __sprite = undefined;
    VariableBind("sprite", function()
    {
        return __sprite;
    }, function(arg0)
    {
        if (is_string(arg0) && _debugStruct.__relaxedSprites)
            arg0 = asset_get_index(arg0);
        
        __sprite = arg0;
        
        if (__sprite != undefined && sprite_exists(__sprite))
            Set("size", [sprite_get_width(__sprite), sprite_get_height(__sprite)]);
        else
            Set("size", [0, 0]);
    });
    CallbackSetDraw(function()
    {
        if (__sprite != undefined && sprite_exists(__sprite))
        {
            var _image = image;
            
            if (is_bool(_image))
                _image = real(_image);
            
            var _color = merge_color(color, animBlend, animBlendAmount);
            var _scale = scale * animScale;
            var _alpha = alpha * animAlpha;
            
            if (stretch)
            {
                draw_sprite_stretched_ext(__sprite, image, __drawLeft, __drawTop, __localRight - __localLeft, __localBottom - __localTop, _color, _alpha);
            }
            else
            {
                var _x = ((0.5 * (__drawLeft + __drawRight)) + sprite_get_xoffset(__sprite)) - ((__localRight - __localLeft) / 2);
                var _y = ((0.5 * (__drawTop + __drawBottom)) + sprite_get_yoffset(__sprite)) - ((__localBottom - __localTop) / 2);
                draw_sprite_ext(__sprite, image, _x, _y, 1, 1, 0, _color, _alpha);
            }
        }
    });
}
