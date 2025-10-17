function __uiClassOnionLayer(arg0, arg1, arg2, arg3) constructor
{
    static _global = __uiGlobal();
    
    static toString = function()
    {
        return "<layer " + __name + ">";
    };
    
    static __VolatileMark = function()
    {
        __uiTrace("Layer \"", __name, "\" marked as volatile");
        __volatile = true;
        __volatileKeepAlive = true;
    };
    
    static __VolatileKeepAlive = function()
    {
        __volatileKeepAlive = true;
    };
    
    static __Step = function()
    {
        _global.__currentOnionLayer = __name;
        _global.__currentOnionLayerStruct = self;
        uiStep(__struct);
        var _i = 0;
        
        repeat (array_length(__struct.__children))
        {
            var _child = __struct.__children[_i];
            
            with (_child)
            {
                if (!__init_performed)
                {
                    if (__CallbackExists(UnknownEnum.Value_10))
                        __CallbackGet(UnknownEnum.Value_10).__Call(self);
                    
                    __init_performed = true;
                }
            }
            
            _i++;
        }
        
        _global.__currentOnionLayer = undefined;
        _global.__currentOnionLayerStruct = undefined;
        
        if (__volatile)
        {
            if (__volatileKeepAlive)
                __volatileKeepAlive = false;
            else
                __destroyed = true;
        }
    };
    
    static __HoverDirectionalOverrideCheck = function(arg0, arg1)
    {
        var _distance = point_distance(0, 0, arg0, arg1);
        var _nX = arg0 / _distance;
        var _nY = arg1 / _distance;
        
        if (_distance < 0.2)
        {
            __struct.__root.__inputDirectionState = false;
            return false;
        }
        else if (!__struct.__root.__inputDirectionState)
        {
            var _navDirection = undefined;
            
            if (abs(_nX) > abs(_nY))
            {
                if (_nX < 0)
                    _navDirection = 180;
                else
                    _navDirection = 0;
            }
            else if (_nY < 0)
            {
                _navDirection = 90;
            }
            else
            {
                _navDirection = 270;
            }
            
            var _hover_source = __uiNullableRefResolve(__struct.__root.__hoverRef);
            
            if (_hover_source != undefined && struct_get_from_hash(_hover_source, variable_get_hash("__directionalOverride")) != undefined)
            {
                var _target_name = _hover_source.__directionalOverride[round(_navDirection / 90)];
                
                if (_target_name != "")
                {
                    __uiHoverSet(__struct, uiFindRelaxed(__struct, _target_name), false);
                    __struct.__root.__inputDirectionState = true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        
        return false;
    };
    
    static __HoverFirst = function(arg0)
    {
        if (!is_struct(__struct))
            exit;
        
        with (__struct)
        {
            var _hoverStruct = __uiNullableRefResolve(__root.__hoverRef);
            
            if (!is_struct(_hoverStruct))
            {
                _hoverStruct = __HoverSearchFirst(arg0);
                
                if (_hoverStruct == undefined)
                    exit;
            }
            
            if (!__uiNullableRefAlive(__root.__draggingRef))
            {
                with (_hoverStruct)
                {
                    if (centreOnHover)
                    {
                        other.__root.__pointerX = (0.5 * (__worldLeft + __worldRight)) - 8;
                        other.__root.__pointerY = (0.5 * (__worldTop + __worldBottom)) - 8;
                    }
                }
            }
            
            __uiHoverSet(self, _hoverStruct, arg0, true);
        }
    };
    
    __struct = arg0;
    __name = string(arg1);
    __priority = arg2;
    __sensitivity = arg3;
    __volatile = false;
    __volatileKeepAlive = true;
    __destroyed = false;
    __uiTrace("Created onion layer \"", arg1, "\" for root struct ", arg0, " (priority=", arg2, ", sensitivity=", arg3, ")");
}

enum UnknownEnum
{
    Value_10 = 10
}
