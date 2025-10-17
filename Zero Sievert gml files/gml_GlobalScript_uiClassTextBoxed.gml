uiAddBoxType("UiTextBoxed", uiClassTextBoxed, false);

function uiClassTextBoxed() : __uiClassCommon() constructor
{
    static __UpdateSize = function()
    {
        var _oldFont = draw_get_font();
        draw_set_font_language(language_resolve_font(__font));
        __label = text_split(__label, __wrapWidth, "\n");
        Set("size", [string_width(__label) + (2 * __margin), string_height(__label) + (2 * __margin)]);
        draw_set_font_language(_oldFont);
    };
    
    color = 16777215;
    scale = 1;
    alpha = 1;
    hAlign = "center";
    vAlign = "middle";
    __label = "???";
    __margin = 0;
    __font = "font_munro_32px";
    __wrap = false;
    __wrapWidth = 999999;
    __linePoint = undefined;
    VariableBind("label", function()
    {
        return __label;
    }, function(arg0)
    {
        __label = language_get_string(arg0);
        __UpdateSize();
    });
    VariableBind("margin", function()
    {
        return __margin;
    }, function(arg0)
    {
        __margin = arg0;
        __UpdateSize();
    });
    VariableBind("font", function()
    {
        return __font;
    }, function(arg0)
    {
        __font = arg0;
        __UpdateSize();
    });
    VariableBind("wrap", function()
    {
        return __wrap;
    }, function(arg0)
    {
        __wrap = arg0;
        __UpdateSize();
    });
    VariableBind("wrapWidth", function()
    {
        return __wrapWidth;
    }, function(arg0)
    {
        __wrapWidth = arg0;
        __UpdateSize();
    });
    VariableBind("linePoint", function()
    {
        return __linePoint;
    }, function(arg0)
    {
        __linePoint = arg0;
    });
    CallbackSetDraw(function()
    {
        uiCallInherited();
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        draw_set_color(_color);
        draw_set_alpha(_alpha);
        draw_set_font_language(language_resolve_font(__font));
        var _box_offset = [0, 0];
        
        switch (hAlign)
        {
            case "left":
                draw_set_halign(fa_left);
                _box_offset[0] = (__drawRight - __drawLeft) * 0.5;
                break;
            
            case "center":
            case "centre":
                draw_set_halign(fa_center);
                break;
            
            case "right":
                draw_set_halign(fa_right);
                _box_offset[0] = -(__drawRight - __drawLeft) * 0.5;
                break;
            
            default:
                __uiError("Unhandled value for .hAlign \"", hAlign, "\"");
                break;
        }
        
        switch (vAlign)
        {
            case "top":
                draw_set_valign(fa_top);
                _box_offset[1] = (__drawBottom - __drawTop) * 0.5;
                break;
            
            case "middle":
                draw_set_valign(fa_middle);
                break;
            
            case "bottom":
                draw_set_valign(fa_bottom);
                _box_offset[1] = -(__drawBottom - __drawTop) * 0.5;
                break;
            
            default:
                __uiError("Unhandled value for .vAlign \"", vAlign, "\"");
                break;
        }
        
        var _margins = 8;
        var _x1 = (__drawLeft + _box_offset[0]) - _margins;
        var _y1 = (__drawTop + _box_offset[1]) - _margins;
        var _x2 = (__drawRight - __drawLeft) + _margins;
        var _y2 = __drawBottom - __drawTop;
        
        if (is_array(__linePoint))
        {
            var _center_x = _x1 + (_x2 * 0.5);
            var _center_y = _y1 + (_y2 * 0.5);
            var _line_x2 = __linePoint[0];
            var _line_y2 = __linePoint[1];
            var _direction = point_direction(_center_x, _center_y, _line_x2, _line_y2);
            var _distance = point_distance(_center_x, _center_y, _line_x2, _line_y2);
            var _line_x1 = clamp(_center_x + lengthdir_x(_distance, _direction), _x1, _x1 + _x2);
            var _line_y1 = clamp(_center_y + lengthdir_y(_distance, _direction), _y1, _y1 + _y2);
            draw_set_color(c_white);
            draw_line_width(_line_x1, _line_y1, _line_x2, _line_y2, 8);
        }
        
        draw_set_color(_color);
        scr_draw_box(s_box_testo_pop_up, _x1, _y1, _x2, _y2, 1);
        draw_text_ext((0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, __label, global.language_font_offset.linebreak_height, 9999999);
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    });
}
