function uiDraw(arg0)
{
    static _debugStruct = __uiGlobal().__debug;
    
    if (!is_struct(arg0))
        exit;
    
    __uiRootStackPush(arg0);
    
    with (arg0)
    {
        __Draw(0, 0, false);
        __Draw_End(0, 0, false);
        var _draggingRef = __root.__draggingRef;
        
        if (__uiNullableRefAlive(_draggingRef))
            __uiNullableRefResolve(_draggingRef).__Draw(0, 0, true);
        
        if (__active && __visible)
        {
            if (_debugStruct.__showPointer)
            {
                var _x = uiPointerGetX(arg0);
                var _y = uiPointerGetY(arg0);
                var _oldAlpha = draw_get_alpha();
                var _oldColor = draw_get_color();
                draw_set_color(c_white);
                draw_set_alpha(1);
                draw_circle(_x, _y, 10, true);
                draw_triangle(_x, _y, _x + 15, _y + 5, _x + 5, _y + 15, true);
                draw_set_color(_oldColor);
                draw_set_alpha(_oldAlpha);
            }
            
            if (_debugStruct.__showFreeNav && __uiNullableRefAlive(__root.__hoverRef))
            {
                var _aX, _aY;
                
                with (__uiNullableRefResolve(__root.__hoverRef))
                {
                    _aX = 0.5 * (__drawLeft + __drawRight);
                    _aY = 0.5 * (__drawTop + __drawBottom);
                }
                
                var _nX = obj_gamepad.input_decimal[UnknownEnum.Value_17] - obj_gamepad.input_decimal[UnknownEnum.Value_16];
                var _nY = obj_gamepad.input_decimal[UnknownEnum.Value_15] - obj_gamepad.input_decimal[UnknownEnum.Value_14];
                var _d = sqrt((_nX * _nX) + (_nY * _nY));
                
                if (_d > 0.25)
                {
                    _nX /= _d;
                    _nY /= _d;
                    var _resultArray = [];
                    __HoverFreeSearchDebug(_aX, _aY, _nX, _nY, self, -infinity, -infinity, infinity, infinity, undefined, _resultArray);
                    var _min = infinity;
                    var _max = -infinity;
                    var _i = 0;
                    
                    repeat (array_length(_resultArray))
                    {
                        var _distance = _resultArray[_i].__distance;
                        _min = min(_min, _distance);
                        _max = max(_max, _distance);
                        _i++;
                    }
                    
                    _i = 0;
                    
                    repeat (array_length(_resultArray))
                    {
                        var _result = _resultArray[_i];
                        
                        with (_result.__struct)
                        {
                            var _bX = 0.5 * (__drawLeft + __drawRight);
                            var _bY = 0.5 * (__drawTop + __drawBottom);
                            draw_set_colour(c_black);
                            draw_arrow(_aX - 1, _aY, _bX - 1, _bY, 20);
                            draw_arrow(_aX, _aY - 1, _bX, _bY - 1, 20);
                            draw_arrow(_aX + 1, _aY, _bX + 1, _bY, 20);
                            draw_arrow(_aX, _aY + 1, _bX, _bY + 1, 20);
                            draw_set_colour(merge_colour(c_lime, c_red, (_result.__distance - _min) / (_max - _min)));
                            draw_arrow(_aX, _aY, _bX, _bY, 20);
                        }
                        
                        _i++;
                    }
                    
                    _nX = _aX + (80 * _nX);
                    _nY = _aY + (80 * _nY);
                    draw_set_colour(c_black);
                    draw_arrow(_aX - 1, _aY, _nX - 1, _nY, 20);
                    draw_arrow(_aX, _aY - 1, _nX, _nY - 1, 20);
                    draw_arrow(_aX + 1, _aY, _nX + 1, _nY, 20);
                    draw_arrow(_aX, _aY + 1, _nX, _nY + 1, 20);
                    draw_set_colour(c_white);
                    draw_arrow(_aX, _aY, _nX, _nY, 20);
                }
            }
        }
    }
    
    __uiRootStackPop();
}

enum UnknownEnum
{
    Value_14 = 14,
    Value_15,
    Value_16,
    Value_17
}
