uiAddBoxType("UiSpriteButton", uiClassSpriteButton, false);

function uiClassSpriteButton() : uiClassButton() constructor
{
    image = 0;
    color = 16777215;
    heldSprite = undefined;
    heldImage = undefined;
    heldColor = 65280;
    heldAlpha = undefined;
    hoverSprite = undefined;
    hoverImage = undefined;
    hoverColor = 65535;
    hoverAlpha = undefined;
    alpha = 1;
    stretch = false;
    enabled = true;
    __sprite = undefined;
    VariableBind("sprite", function()
    {
        return __sprite;
    }, function(arg0)
    {
        if (is_string(arg0) && _debugStruct.__relaxedSprites)
            arg0 = asset_get_index(arg0);
        
        __sprite = arg0;
        
        if (sprite_exists(__sprite))
            Set("size", [sprite_get_width(__sprite), sprite_get_height(__sprite)]);
        else
            Set("size", [0, 0]);
    });
    CallbackSetDraw(function()
    {
        if (__sprite != undefined && sprite_exists(__sprite))
        {
            var _default_alpha = alpha * animAlpha;
            var _sprite, _image, _color, _alpha;
            
            if (GetButton())
            {
                _sprite = (heldSprite ?? hoverSprite) ?? __sprite;
                _image = (heldImage ?? hoverImage) ?? image;
                _color = (heldColor ?? hoverColor) ?? color;
                _alpha = (heldAlpha ?? hoverAlpha) ?? _default_alpha;
                
                if (!enabled)
                    _color = 8421504;
            }
            else if (GetHover())
            {
                _sprite = hoverSprite ?? __sprite;
                _image = hoverImage ?? image;
                _color = hoverColor ?? color;
                _alpha = hoverAlpha ?? _default_alpha;
                
                if (!enabled)
                    _color = 8421504;
            }
            else
            {
                _sprite = __sprite;
                _image = image;
                _color = color;
                _alpha = _default_alpha;
                
                if (!enabled)
                    _color = 4210752;
            }
            
            if (enabled)
                _color = merge_color(_color, animBlend, animBlendAmount);
            
            if (stretch)
            {
                draw_sprite_stretched_ext(_sprite, _image, __drawLeft, __drawTop, __localRight - __localLeft, __localBottom - __localTop, _color, _alpha);
            }
            else
            {
                var _x = ((0.5 * (__drawLeft + __drawRight)) + sprite_get_xoffset(_sprite)) - ((__drawRight - __drawLeft) / 2);
                var _y = ((0.5 * (__drawTop + __drawBottom)) + sprite_get_yoffset(_sprite)) - ((__drawBottom - __drawTop) / 2);
                draw_sprite_ext(_sprite, _image, _x, _y, 1, 1, 0, _color, _alpha);
            }
        }
    });
}
