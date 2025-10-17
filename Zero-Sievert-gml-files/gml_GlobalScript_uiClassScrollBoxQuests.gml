uiAddBoxType("UiScrollBoxQuests", uiClassScrollBoxQuests, false);

function uiClassScrollBoxQuests() : uiClassScrollBox() constructor
{
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
        
        if (uiPointerIsDirectional() && uiPointerGetX() > 800)
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
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_25 = 25,
    Value_35 = 35,
    Value_36,
    Value_37,
    Value_38
}
