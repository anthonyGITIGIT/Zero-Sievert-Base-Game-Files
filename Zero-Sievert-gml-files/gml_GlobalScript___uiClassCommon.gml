function __uiClassCommon(arg0 = instanceof(self)) constructor
{
    static _global = __uiGlobal();
    static _debugStruct = _global.__debug;
    static _nullCallback = _global.__nullCallback;
    
    static SetVisibleWithChildren = function(arg0)
    {
        var _count = ChildrenCount();
        
        for (var _i = 0; _i < array_length(__children); _i++)
        {
            if (__visible_nested_reactive)
                __children[_i].__visible = arg0;
            
            __children[_i].SetVisibleWithChildren(arg0);
        }
    };
    
    static toString = function()
    {
        return identifier;
    };
    
    static Destroy = function()
    {
        if (__destroyed)
            exit;
        
        __DestroyInner();
        ParentChange(undefined);
    };
    
    static __DestroyInner = function()
    {
        if (__destroyed)
            exit;
        
        __destroyed = true;
        Set("active", false);
        Set("visible", false);
        var _i = 0;
        
        repeat (array_length(__children))
        {
            __children[_i].__DestroyInner();
            _i++;
        }
    };
    
    static GetType = function()
    {
        return __type;
    };
    
    static GetHover = function()
    {
        return __stateHover;
    };
    
    static GetHoverStruct = function()
    {
        return __uiNullableRefResolve(__FindRoot().__root.__hoverRef);
    };
    
    static GetDragging = function()
    {
        return __stateDragging;
    };
    
    static GetDragSuccess = function()
    {
        return __stateDragSuccess;
    };
    
    static GetDraggedStruct = function()
    {
        return __uiNullableRefResolve(__FindRoot().__root.__draggingRef);
    };
    
    static GetAnyDragging = function()
    {
        return __uiNullableRefAlive(__FindRoot().__root.__draggingRef);
    };
    
    static GetButton = function(arg0)
    {
        if (arg0 == undefined)
            return variable_struct_names_count(__stateButtonDict) > 0;
        
        return variable_struct_get(__stateButtonDict, arg0) ?? false;
    };
    
    static Find = function(arg0)
    {
        if (identifier == arg0)
            return self;
        
        var _i = 0;
        
        repeat (array_length(__children))
        {
            var _found = __children[_i].Find(arg0);
            
            if (_found != undefined)
                return _found;
            
            _i++;
        }
        
        return undefined;
    };
    
    static FindType = function(arg0, arg1)
    {
        if (__type == arg1)
            array_push(arg0, self);
        
        var _i = 0;
        
        repeat (array_length(__children))
        {
            __children[_i].FindType(arg0, arg1);
            _i++;
        }
    };
    
    static HoverStateSet = function(arg0)
    {
        __stateHover = arg0;
        return self;
    };
    
    static ButtonStateSet = function(arg0, arg1)
    {
        if (arg1)
            variable_struct_set(__stateButtonDict, arg0, true);
        else
            variable_struct_remove(__stateButtonDict, arg0);
    };
    
    static VariableBind = function(arg0, arg1, arg2)
    {
        variable_struct_set(__getter, arg0, (arg1 == undefined) ? arg1 : method(undefined, arg1));
        variable_struct_set(__setter, arg0, (arg2 == undefined) ? arg2 : method(undefined, arg2));
    };
    
    static Get = function(arg0)
    {
        var _method = variable_struct_get(__getter, arg0);
        
        if (is_method(_method))
            return _method();
        else
            return variable_struct_get(self, arg0);
    };
    
    static Set = function(arg0, arg1)
    {
        var _method = variable_struct_get(__setter, arg0);
        
        if (is_method(_method))
            _method(arg1);
        else
            variable_struct_set(self, arg0, arg1);
    };
    
    static ReplaceFromFile = function(arg0)
    {
        __uiTrace("Reloading \"", self, "\" (file = \"", arg0, "\")");
        var _oldCreateTarget = _global.__createReplaceTarget;
        _global.__createReplaceTarget = self;
        __uiFileEnsure(arg0).__Execute();
        _global.__createReplaceTarget = _oldCreateTarget;
        Destroy();
    };
    
    static BuildIn = function()
    {
        if (__CallbackExists(UnknownEnum.Value_25))
        {
            __animMode = 1;
            __animTime = 0;
            __CallbackGet(UnknownEnum.Value_25).__Call(self, __animTime);
        }
        
        var _i = 0;
        
        repeat (array_length(__children))
        {
            __children[_i].BuildIn();
            _i++;
        }
    };
    
    static BuildFinish = function()
    {
        __animMode = 0;
    };
    
    static GetBuilding = function()
    {
        return __animMode;
    };
    
    static CallbackSet = function(arg0, arg1)
    {
        var _targetArray = __callbackArray[arg0];
        var _callback = new __uiClassCallback(_targetArray[0], arg1, false);
        array_insert(_targetArray, 0, _callback);
        return self;
    };
    
    static CallbackSetHoverStart = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_0, arg0);
    };
    
    static CallbackSetHover = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_1, arg0);
    };
    
    static CallbackSetHoverEnd = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_2, arg0);
    };
    
    static CallbackSetCanHover = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_3, arg0);
    };
    
    static CallbackSetButtonStart = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_4, arg0);
    };
    
    static CallbackSetButton = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_5, arg0);
    };
    
    static CallbackSetButtonEnd = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_6, arg0);
    };
    
    static CallbackSetButtonClose = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_9, arg0);
    };
    
    static CallbackSetButtonClick = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_7, arg0);
    };
    
    static CallbackSetButtonCanCapture = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_8, arg0);
    };
    
    static CallbackSetInit = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_10, arg0);
    };
    
    static CallbackSetStep = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_11, arg0);
    };
    
    static CallbackSetDraw = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_12, arg0);
    };
    
    static CallbackSetDrawEnd = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_13, arg0);
    };
    
    static CallbackSetOnClose = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_14, arg0);
    };
    
    static CallbackSetPush = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_15, arg0);
    };
    
    static CallbackSetChildrenChanged = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_16, arg0);
    };
    
    static CallbackSetParentChanged = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_17, arg0);
    };
    
    static CallbackSetDnDCanReceive = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_18, arg0);
    };
    
    static CallbackSetDnDOnReceive = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_19, arg0);
    };
    
    static CallbackSetDnDOnPlace = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_20, arg0);
    };
    
    static CallbackSetLayoutExecute = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_21, arg0);
    };
    
    static CallbackSetLayoutCheck = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_22, arg0);
    };
    
    static CallbackSetOnValueChange = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_23, arg0);
    };
    
    static CallbackSetValueUpdate = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_24, arg0);
    };
    
    static CallbackSetBuildIn = function(arg0)
    {
        return CallbackSet(UnknownEnum.Value_25, arg0);
    };
    
    static RectangleCollidesWithChildren = function(arg0, arg1, arg2, arg3, arg4, arg5 = 0)
    {
        var _i = 0;
        
        repeat (array_length(__children))
        {
            var _child = __children[_i];
            
            if (_child != arg4 && _child.RectangleCollides(arg0, arg1, arg2, arg3, arg5))
                return _child;
            
            _i++;
        }
        
        return undefined;
    };
    
    static RectangleCollides = function(arg0, arg1, arg2, arg3, arg4 = 0)
    {
        return !(__localLeft > (arg2 - arg4) || __localTop > (arg3 - arg4) || __localRight < (arg0 + arg4) || __localBottom < (arg1 + arg4));
    };
    
    static CollidesWith = function(arg0, arg1 = 0)
    {
        if (arg0 == undefined)
            return false;
        
        return arg0.RectangleCollides(__localLeft, __localTop, __localRight, __localBottom, arg1);
    };
    
    static CollidesWithSiblings = function(arg0 = 0)
    {
        if (__parent == undefined)
            return false;
        
        return __parent.RectangleCollidesWithChildren(__localLeft, __localTop, __localRight, __localBottom, arg0) != undefined;
    };
    
    static HasChildren = function()
    {
        return array_length(__children) > 0;
    };
    
    static ChildrenCount = function()
    {
        return array_length(__children);
    };
    
    static ChildrenClear = function()
    {
        repeat (array_length(__children))
        {
            with (__children[0])
                Destroy();
        }
        
        __children = [];
        __CallbackGet(UnknownEnum.Value_16).__Call(self);
    };
    
    static ChildPrevious = function(arg0)
    {
        var _index = ChildFindIndex(arg0);
        return (_index <= 0 || _index == undefined) ? undefined : __children[_index - 1];
    };
    
    static ChildNext = function(arg0)
    {
        var _index = ChildFindIndex(arg0);
        return (_index >= (array_length(__children) - 1) || _index == undefined) ? undefined : __children[_index + 1];
    };
    
    static ChildFindIndex = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(__children))
        {
            if (__children[_i] == arg0)
                return _i;
            
            _i++;
        }
        
        return undefined;
    };
    
    static __ChildAdd = function(arg0, arg1 = false)
    {
        var _oldParent = arg0.__parent;
        arg0.__parent = self;
        array_push(__children, arg0);
        
        if (!arg1)
        {
            with (arg0)
                __CallbackGet(UnknownEnum.Value_17).__Call(self, __parent, _oldParent);
            
            __CallbackGet(UnknownEnum.Value_16).__Call(self);
        }
    };
    
    static __ChildReplace = function(arg0, arg1, arg2 = false)
    {
        var _oldParent = arg0.__parent;
        arg0.__parent = self;
        __children[arg1] = arg0;
        
        if (!arg2)
        {
            with (arg0)
                __CallbackGet(UnknownEnum.Value_17).__Call(self, __parent, _oldParent);
            
            __CallbackGet(UnknownEnum.Value_16).__Call(self);
        }
    };
    
    static __ChildRemove = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(__children))
        {
            if (__children[_i] == arg0)
                array_delete(__children, _i, 1);
            else
                _i++;
        }
        
        __CallbackGet(UnknownEnum.Value_16).__Call(self);
    };
    
    static __ChildBuildDictionary = function(arg0)
    {
        variable_struct_set(arg0, identifier, self);
        var _i = 0;
        
        repeat (array_length(__children))
        {
            __children[_i].__ChildBuildDictionary(arg0);
            _i++;
        }
        
        return arg0;
    };
    
    static ParentChange = function(arg0)
    {
        if (__parent != undefined)
            __parent.__ChildRemove(self);
        
        if (arg0 != undefined)
            arg0.__ChildAdd(self);
    };
    
    static __PercentageWidth = function(arg0)
    {
        if (is_numeric(arg0))
            return arg0;
        
        if (is_string(arg0))
        {
            if (string_char_at(arg0, string_length(arg0)) == "%")
            {
                var _percentage;
                
                try
                {
                    _percentage = real(string_copy(arg0, 1, string_length(arg0) - 1));
                }
                catch (_error)
                {
                    __uiError("Failed to parse percentage string \"", arg0, "\"");
                }
                
                if (__parent == undefined && variable_struct_exists(self, "__root"))
                {
                    __uiTrace("Warning! No parent found for root element percentage calculation, using room size");
                    return (room_width * _percentage) / 100;
                }
                else
                {
                    return ((__parent.__localRight - __parent.__localLeft) * _percentage) / 100;
                }
            }
        }
        
        __uiError("Invalid parameter for x-axis \"", arg0, "\"");
    };
    
    static __PercentageHeight = function(arg0)
    {
        if (is_numeric(arg0))
            return arg0;
        
        if (is_string(arg0))
        {
            if (string_char_at(arg0, string_length(arg0)) == "%")
            {
                var _percentage;
                
                try
                {
                    _percentage = real(string_copy(arg0, 1, string_length(arg0) - 1));
                }
                catch (_error)
                {
                    __uiError("Failed to parse percentage string \"", arg0, "\"");
                }
                
                if (__parent == undefined && variable_struct_exists(self, "__root"))
                {
                    __uiTrace("Warning! No parent found for root element percentage calculation, using room size");
                    return (room_height * _percentage) / 100;
                }
                else
                {
                    return ((__parent.__localBottom - __parent.__localTop) * _percentage) / 100;
                }
            }
        }
        
        __uiError("Invalid parameter for y-axis \"", arg0, "\"");
    };
    
    static __ScrollParentToSelf = function()
    {
        if (__parent != undefined)
            __parent.__ScrollTo(self);
    };
    
    static __ScrollTo = function(arg0)
    {
        __ScrollParentToSelf();
    };
    
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
        
        if (!__init_performed)
        {
            if (arg2 && __active && __CallbackExists(UnknownEnum.Value_10))
                __CallbackGet(UnknownEnum.Value_10).__Call(self);
            
            __init_performed = true;
        }
        
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
                _child.__Step(__worldLeft, __worldTop, arg2);
                _i++;
            }
        }
        
        __uiContextStackPop();
    };
    
    static __Draw = function(arg0, arg1, arg2)
    {
        if (__stateDragging && !arg2)
            exit;
        
        __uiContextStackPush(self);
        arg0 += animXOffset;
        arg1 += animYOffset;
        
        if (__stateDragging)
        {
            arg0 = __dragOffsetX;
            arg1 = __dragOffsetY;
        }
        
        __drawOffsetX = arg0;
        __drawOffsetY = arg1;
        __drawLeft = arg0 + __localLeft;
        __drawTop = arg1 + __localTop;
        __drawRight = arg0 + __localRight;
        __drawBottom = arg1 + __localBottom;
        
        if (_debugStruct.__showSkeleton)
        {
            var _oldColor = draw_get_color();
            var _oldAlpha = draw_get_alpha();
            draw_set_color(c_white);
            draw_set_alpha(1);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true);
            draw_set_color(_oldColor);
            draw_set_alpha(_oldAlpha);
        }
        
        if (__visible)
            __CallbackGet(UnknownEnum.Value_12).__Call(self);
        
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
                _child.__Draw(__drawLeft, __drawTop, arg2);
                _i++;
            }
        }
        
        if (_debugStruct.__showNavigationGraph)
        {
            var _oldColor = draw_get_color();
            _i = 0;
            
            repeat (array_length(__children))
            {
                with (__children[_i])
                {
                    if (__uiNullableRefAlive(__navigationRight))
                    {
                        draw_set_color(c_red);
                        var _target = __uiNullableRefResolve(__navigationRight);
                        draw_arrow(0.5 * (__drawLeft + __drawRight), (0.5 * (__drawTop + __drawBottom)) - 4, 0.5 * (_target.__drawLeft + _target.__drawRight), (0.5 * (_target.__drawTop + _target.__drawBottom)) - 4, 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationUp))
                    {
                        draw_set_color(c_lime);
                        var _target = __uiNullableRefResolve(__navigationUp);
                        draw_arrow((0.5 * (__drawLeft + __drawRight)) - 4, 0.5 * (__drawTop + __drawBottom), (0.5 * (_target.__drawLeft + _target.__drawRight)) - 4, 0.5 * (_target.__drawTop + _target.__drawBottom), 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationLeft))
                    {
                        draw_set_color(c_aqua);
                        var _target = __uiNullableRefResolve(__navigationLeft);
                        draw_arrow(0.5 * (__drawLeft + __drawRight), (0.5 * (__drawTop + __drawBottom)) + 4, 0.5 * (_target.__drawLeft + _target.__drawRight), (0.5 * (_target.__drawTop + _target.__drawBottom)) + 4, 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationDown))
                    {
                        draw_set_color(c_fuchsia);
                        var _target = __uiNullableRefResolve(__navigationDown);
                        draw_arrow((0.5 * (__drawLeft + __drawRight)) + 4, 0.5 * (__drawTop + __drawBottom), (0.5 * (_target.__drawLeft + _target.__drawRight)) + 4, 0.5 * (_target.__drawTop + _target.__drawBottom), 10);
                    }
                }
                
                _i++;
            }
            
            draw_set_color(_oldColor);
        }
        
        __uiContextStackPop();
    };
    
    static __Draw_End = function(arg0, arg1, arg2)
    {
        if (__stateDragging && !arg2)
            exit;
        
        __uiContextStackPush(self);
        arg0 += animXOffset;
        arg1 += animYOffset;
        
        if (__stateDragging)
        {
            arg0 = __dragOffsetX;
            arg1 = __dragOffsetY;
        }
        
        __drawOffsetX = arg0;
        __drawOffsetY = arg1;
        __drawLeft = arg0 + __localLeft;
        __drawTop = arg1 + __localTop;
        __drawRight = arg0 + __localRight;
        __drawBottom = arg1 + __localBottom;
        
        if (_debugStruct.__showSkeleton)
        {
            var _oldColor = draw_get_color();
            var _oldAlpha = draw_get_alpha();
            draw_set_color(c_white);
            draw_set_alpha(1);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true);
            draw_set_color(_oldColor);
            draw_set_alpha(_oldAlpha);
        }
        
        if (__visible)
            __CallbackGet(UnknownEnum.Value_13).__Call(self);
        
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
                _child.__Draw_End(__drawLeft, __drawTop, arg2);
                _i++;
            }
        }
        
        if (_debugStruct.__showNavigationGraph)
        {
            var _oldColor = draw_get_color();
            _i = 0;
            
            repeat (array_length(__children))
            {
                with (__children[_i])
                {
                    if (__uiNullableRefAlive(__navigationRight))
                    {
                        draw_set_color(c_red);
                        var _target = __uiNullableRefResolve(__navigationRight);
                        draw_arrow(0.5 * (__drawLeft + __drawRight), (0.5 * (__drawTop + __drawBottom)) - 4, 0.5 * (_target.__drawLeft + _target.__drawRight), (0.5 * (_target.__drawTop + _target.__drawBottom)) - 4, 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationUp))
                    {
                        draw_set_color(c_lime);
                        var _target = __uiNullableRefResolve(__navigationUp);
                        draw_arrow((0.5 * (__drawLeft + __drawRight)) - 4, 0.5 * (__drawTop + __drawBottom), (0.5 * (_target.__drawLeft + _target.__drawRight)) - 4, 0.5 * (_target.__drawTop + _target.__drawBottom), 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationLeft))
                    {
                        draw_set_color(c_aqua);
                        var _target = __uiNullableRefResolve(__navigationLeft);
                        draw_arrow(0.5 * (__drawLeft + __drawRight), (0.5 * (__drawTop + __drawBottom)) + 4, 0.5 * (_target.__drawLeft + _target.__drawRight), (0.5 * (_target.__drawTop + _target.__drawBottom)) + 4, 10);
                    }
                    
                    if (__uiNullableRefAlive(__navigationDown))
                    {
                        draw_set_color(c_fuchsia);
                        var _target = __uiNullableRefResolve(__navigationDown);
                        draw_arrow((0.5 * (__drawLeft + __drawRight)) + 4, 0.5 * (__drawTop + __drawBottom), (0.5 * (_target.__drawLeft + _target.__drawRight)) + 4, 0.5 * (_target.__drawTop + _target.__drawBottom), 10);
                    }
                }
                
                _i++;
            }
            
            draw_set_color(_oldColor);
        }
        
        __uiContextStackPop();
    };
    
    static __FindRoot = function()
    {
        return is_struct(__parent) ? __parent.__FindRoot() : self;
    };
    
    static __CallbackSetFromCatspeak = function(arg0, arg1)
    {
        var _targetArray = __callbackArray[arg0];
        var _callback = new __uiClassCallback(_targetArray[0], arg1, true);
        array_insert(_targetArray, 0, _callback);
        return self;
    };
    
    static __CallbackExists = function(arg0)
    {
        return array_length(__callbackArray[arg0]) > 1;
    };
    
    static __CallbackCategoryExists = function(arg0)
    {
        switch (arg0)
        {
            case UnknownEnum.Value_10:
                return __CallbackExists(UnknownEnum.Value_10);
                break;
            
            case UnknownEnum.Value_0:
            case UnknownEnum.Value_1:
            case UnknownEnum.Value_2:
            case UnknownEnum.Value_27:
                return __CallbackExists(UnknownEnum.Value_0) || __CallbackExists(UnknownEnum.Value_1) || __CallbackExists(UnknownEnum.Value_2);
                break;
            
            case UnknownEnum.Value_4:
            case UnknownEnum.Value_5:
            case UnknownEnum.Value_6:
            case UnknownEnum.Value_7:
            case UnknownEnum.Value_8:
            case UnknownEnum.Value_28:
                return __CallbackExists(UnknownEnum.Value_4) || __CallbackExists(UnknownEnum.Value_5) || __CallbackExists(UnknownEnum.Value_6) || __CallbackExists(UnknownEnum.Value_7) || __CallbackExists(UnknownEnum.Value_8);
                break;
            
            case UnknownEnum.Value_11:
                return __CallbackExists(UnknownEnum.Value_11);
                break;
            
            case UnknownEnum.Value_12:
                return __CallbackExists(UnknownEnum.Value_12);
                break;
            
            case UnknownEnum.Value_13:
                return __CallbackExists(UnknownEnum.Value_13);
                break;
            
            case UnknownEnum.Value_29:
                return __CallbackCategoryExists(UnknownEnum.Value_27) || __CallbackCategoryExists(UnknownEnum.Value_28);
                break;
            
            default:
                __uiError("Unhandled call type ", arg0);
                break;
        }
    };
    
    static __CallbackGet = function(arg0)
    {
        return __callbackArray[arg0][0] ?? _nullCallback;
    };
    
    static __FindCaptureCast = function(arg0, arg1)
    {
        if (__active && __animMode == 0 && __CanCaptureCast(arg0, arg1))
            return self;
        
        var _i = 0;
        
        repeat (array_length(__children))
        {
            var _captureStruct = __children[_i].__FindCaptureCast(arg0, arg1);
            
            if (_captureStruct != undefined)
                return _captureStruct;
            
            _i++;
        }
        
        return undefined;
    };
    
    static __CanCaptureClick = function(arg0, arg1)
    {
        if (!(variable_struct_get(__captureClickDict, arg0) ?? false))
            return false;
        
        if (!__CallbackExists(UnknownEnum.Value_8))
            return true;
        
        return __CallbackGet(UnknownEnum.Value_8).__Call(self, arg0, arg1);
    };
    
    static __CanCaptureCast = function(arg0, arg1)
    {
        if (!(variable_struct_get(__captureCastDict, arg0) ?? false))
            return false;
        
        if (!__CallbackExists(UnknownEnum.Value_8))
            return true;
        
        return __CallbackGet(UnknownEnum.Value_8).__Call(self, arg0, arg1);
    };
    
    static __CanCaptureClickAnyEver = function()
    {
        if (array_length(__captureClickArray) <= 0)
            return false;
        
        return __CallbackCategoryExists(UnknownEnum.Value_28);
    };
    
    static __CanCaptureAnyEver = function()
    {
        if (array_length(__captureClickArray) <= 0 && array_length(__captureCastArray) <= 0)
            return false;
        
        return __CallbackCategoryExists(UnknownEnum.Value_28);
    };
    
    static __CanCaptureClickAnyNow = function()
    {
        var _length = array_length(__captureClickArray);
        
        if (_length <= 0)
            return false;
        
        if (!__CallbackCategoryExists(UnknownEnum.Value_28))
            return false;
        
        if (!__CallbackCategoryExists(UnknownEnum.Value_8))
            return true;
        
        var _canCaptureCallback = __CallbackGet(UnknownEnum.Value_8);
        var _i = 0;
        
        repeat (_length)
        {
            if (_canCaptureCallback(__captureClickArray[_i]))
                return true;
            
            _i++;
        }
        
        return false;
    };
    
    static __CanHover = function(arg0)
    {
        if (!__CallbackCategoryExists(UnknownEnum.Value_27))
            return false;
        
        if (!__CallbackExists(UnknownEnum.Value_3))
            return true;
        
        return __CallbackGet(UnknownEnum.Value_3).__Call(self, arg0);
    };
    
    static __CanReceiveDnD = function(arg0)
    {
        if (!__CallbackExists(UnknownEnum.Value_18))
            return false;
        
        return __CallbackGet(UnknownEnum.Value_18).__Call(self, arg0);
    };
    
    static __OnReceiveDnD = function(arg0)
    {
        if (!__CallbackExists(UnknownEnum.Value_19))
            exit;
        
        return __CallbackGet(UnknownEnum.Value_19).__Call(self, arg0);
    };
    
    static __OnPlaceDnD = function(arg0)
    {
        if (!__CallbackExists(UnknownEnum.Value_20))
            exit;
        
        return __CallbackGet(UnknownEnum.Value_20).__Call(self, arg0);
    };
    
    static NavigationLinkRight = function(arg0, arg1 = true)
    {
        if (is_struct(arg0))
        {
            if (arg1 || !is_struct(arg0.Get("navigationLeft")))
                arg0.Set("navigationLeft", self);
        }
        
        Set("navigationRight", arg0);
    };
    
    static NavigationLinkUp = function(arg0, arg1 = true)
    {
        if (is_struct(arg0))
        {
            if (arg1 || !is_struct(arg0.Get("navigationDown")))
                arg0.Set("navigationDown", self);
        }
        
        Set("navigationUp", arg0);
    };
    
    static NavigationLinkLeft = function(arg0, arg1 = true)
    {
        if (is_struct(arg0))
        {
            if (arg1 || !is_struct(arg0.Get("navigationRight")))
                arg0.Set("navigationRight", self);
        }
        
        Set("navigationLeft", arg0);
    };
    
    static NavigationLinkDown = function(arg0, arg1 = true)
    {
        if (is_struct(arg0))
        {
            if (arg1 || !is_struct(arg0.Get("navigationUp")))
                arg0.Set("navigationUp", self);
        }
        
        Set("navigationDown", arg0);
    };
    
    static __LayoutBuildOrder = function(arg0)
    {
        if (__CallbackExists(UnknownEnum.Value_21) || __CallbackExists(UnknownEnum.Value_22))
            array_push(arg0, self);
        
        var _i = 0;
        
        repeat (array_length(__children))
        {
            __children[_i].__LayoutBuildOrder(arg0);
            _i++;
        }
    };
    
    static __LayoutExecute = function()
    {
        return __CallbackGet(UnknownEnum.Value_21).__Call(self);
    };
    
    static __LayoutCheck = function()
    {
        return __CallbackGet(UnknownEnum.Value_22).__Call(self);
    };
    
    static LayoutAsVerticalList = function(arg0, arg1, arg2 = false)
    {
        __layout = 
        {
            __type: "vertical list",
            __alignment: arg0,
            __spacing: arg1,
            __setNavigation: arg2
        };
        
        try
        {
            CallbackSetLayoutExecute(function()
            {
                var _y = 0;
                var _spacing = __layout.__spacing;
                var _setNavigation = __layout.__setNavigation;
                
                switch (__layout.__alignment)
                {
                    case "left":
                        var _elementPrev = undefined;
                        var _i = 0;
                        
                        repeat (array_length(__children))
                        {
                            var _child = __children[_i];
                            _child.Set("x", 0.5 * (_child.__localRight - _child.__localLeft));
                            _child.Set("y", _y + (0.5 * (_child.__localBottom - _child.__localTop)));
                            
                            if (_setNavigation)
                            {
                                _child.NavigationLinkUp(_elementPrev);
                                _elementPrev = _child;
                            }
                            
                            _y += ((_child.__localBottom - _child.__localTop) + _spacing);
                            _i++;
                        }
                        
                        break;
                    
                    case "center":
                        var _x = 0.5 * (__localRight - __localLeft);
                        var _elementPrev = undefined;
                        var _i = 0;
                        
                        repeat (array_length(__children))
                        {
                            var _child = __children[_i];
                            _child.Set("x", _x);
                            _child.Set("y", _y + (0.5 * (_child.__localBottom - _child.__localTop)));
                            
                            if (_setNavigation)
                            {
                                _child.NavigationLinkUp(_elementPrev);
                                _elementPrev = _child;
                            }
                            
                            _y += ((_child.__localBottom - _child.__localTop) + _spacing);
                            _i++;
                        }
                        
                        break;
                    
                    case "right":
                        var _x = __localRight - __localLeft;
                        var _elementPrev = undefined;
                        var _i = 0;
                        
                        repeat (array_length(__children))
                        {
                            var _child = __children[_i];
                            _child.Set("x", _x - (0.5 * (_child.__localRight - _child.__localLeft)));
                            _child.Set("y", _y + (0.5 * (_child.__localBottom - _child.__localTop)));
                            
                            if (_setNavigation)
                            {
                                _child.NavigationLinkUp(_elementPrev);
                                _elementPrev = _child;
                            }
                            
                            _y += ((_child.__localBottom - _child.__localTop) + _spacing);
                            _i++;
                        }
                        
                        break;
                    
                    default:
                        __uiError("Unknown vertical list alignment \"", __layout.__alignment, "\"");
                        break;
                }
            });
            CallbackSetLayoutCheck(function()
            {
                return false;
            });
        }
        catch (_error)
        {
        }
    };
    
    static __FileOriginSearch = function(arg0, arg1)
    {
        if (__uiArrayFindIndex(arg0, __fileOrigin) != undefined)
        {
            array_push(arg1, self);
            return arg1;
        }
        
        var _i = 0;
        
        repeat (array_length(__children))
        {
            __children[_i].__FileOriginSearch(arg0, arg1);
            _i++;
        }
        
        return arg1;
    };
    
    static __HoverSearch = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    {
        if (self == arg6)
            exit;
        
        __uiContextStackPush(self);
        var _hoverStruct = undefined;
        var _visibleLeft = max(arg2, __worldLeft);
        var _visibleTop = max(arg3, __worldTop);
        var _visibleRight = min(arg4, __worldRight);
        var _visibleBottom = min(arg5, __worldBottom);
        
        if (_visibleLeft < _visibleRight && _visibleTop < _visibleBottom && __animMode == 0)
        {
            if (__active && __visible && __CanHover(arg7) && (arg6 == undefined || __CanReceiveDnD(arg6)))
            {
                if (arg0 >= _visibleLeft && arg1 >= _visibleTop && arg0 <= _visibleRight && arg1 <= _visibleBottom)
                    _hoverStruct = self;
            }
            
            if (__captureClipChildren)
            {
                arg2 = _visibleLeft;
                arg3 = _visibleTop;
                arg4 = _visibleRight;
                arg5 = _visibleBottom;
            }
            
            var _i = 0;
            
            repeat (array_length(__children))
            {
                var _childOver = __children[_i].__HoverSearch(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
                
                if (_childOver != undefined)
                    _hoverStruct = _childOver;
                
                _i++;
            }
        }
        
        __uiContextStackPop();
        return _hoverStruct;
    };
    
    static __HoverSearchInDirection = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
    {
        if (self == arg9)
            exit;
        
        __uiContextStackPush(self);
        var _visibleLeft = max(arg5, __worldLeft);
        var _visibleTop = max(arg6, __worldTop);
        var _visibleRight = min(arg7, __worldRight);
        var _visibleBottom = min(arg8, __worldBottom);
        
        if (_visibleLeft < _visibleRight && _visibleTop < _visibleBottom && __animMode == 0)
        {
            var _hovergroups;
            
            if (arg10 == undefined)
                _hovergroups = [];
            else
                _hovergroups = ["quick slot 1", "quick slot 2", "quick slot 3", "quick slot 4", "quick slot 5", "quick slot 6", "quick slot 7", "quick slot 8", "quick slot 9", arg10];
            
            if (__active && __visible && (__CanCaptureClickAnyEver() || __CanHover()) && (arg9 == undefined || __CanReceiveDnD(arg9)) && arg4 != self && __HoverableNotInGroup(_hovergroups))
            {
                if (array_find_index(_hovergroups, self.identifier) == undefined)
                {
                    var _distance = __HoverFreeSearchDistance(arg0, arg1, arg2, arg3);
                    
                    if (_distance < arg11.__distance)
                    {
                        arg11.__struct = self;
                        arg11.__distance = _distance;
                    }
                }
            }
            
            if (__captureClipChildren)
            {
                arg5 = _visibleLeft;
                arg6 = _visibleTop;
                arg7 = _visibleRight;
                arg8 = _visibleBottom;
            }
            
            var _i = 0;
            
            repeat (array_length(__children))
            {
                __children[_i].__HoverSearchInDirection(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11);
                _i++;
            }
        }
        
        __uiContextStackPop();
    };
    
    static __HoverSearchFirst = function(arg0)
    {
        var _openArray = [self];
        
        while (array_length(_openArray) > 0)
        {
            var _target = _openArray[0];
            
            with (_target)
            {
                if (__active)
                {
                    __uiContextStackPush(self);
                    var _result = __CanHover(arg0);
                    __uiContextStackPop();
                    
                    if (_result)
                        return self;
                    
                    array_copy(_openArray, array_length(_openArray), __children, 0, array_length(__children));
                }
            }
            
            array_delete(_openArray, 0, 1);
        }
        
        return undefined;
    };
    
    static __HoverableNotInGroup = function(arg0)
    {
        if (arg0 == undefined || hoverGroup == undefined)
            return true;
        else if (arg0 != undefined)
            return array_find_index(arg0, hoverGroup) == undefined;
        
        return true;
    };
    
    static __HoverFreeSearchDistance = function(arg0, arg1, arg2, arg3)
    {
        arg2 *= 10000;
        arg3 *= 10000;
        var _flo = 0;
        var _fhi = 1;
        var _f0x = (__worldLeft - arg0) / arg2;
        var _f1x = (__worldRight - arg0) / arg2;
        
        if (_f0x > _f1x)
        {
            var _temp = _f0x;
            _f0x = _f1x;
            _f1x = _temp;
        }
        
        if (_f1x > _flo && _f0x < _fhi)
        {
            _flo = max(_flo, _f0x);
            _fhi = min(_fhi, _f1x);
            
            if (_flo < _fhi)
            {
                var _f0y = (__worldTop - arg1) / arg3;
                var _f1y = (__worldBottom - arg1) / arg3;
                
                if (_f0y > _f1y)
                {
                    var _temp = _f0y;
                    _f0y = _f1y;
                    _f1y = _temp;
                }
                
                if (_f1y > _flo && _f0y < _fhi)
                {
                    _flo = max(_flo, _f0y);
                    _fhi = min(_fhi, _f1y);
                    
                    if (_flo < _fhi)
                    {
                        _dX = _flo * arg2;
                        _dY = _flo * arg3;
                        return sqrt((_dX * _dX) + (_dY * _dY));
                    }
                }
            }
        }
        
        var _dX = clamp(arg0, __worldLeft, __worldRight) - arg0;
        var _dY = clamp(arg1, __worldTop, __worldBottom) - arg1;
        var _paraDist = (arg2 * _dX) + (arg3 * _dY);
        var _perpDist = (arg3 * _dX) - (arg2 * _dY);
        
        if (_paraDist <= 0)
            return infinity;
        
        if (abs(_perpDist) >= _paraDist)
            return infinity;
        
        return 500 + _paraDist;
    };
    
    static __HoverFreeSearchDebug = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
    {
        var _visibleLeft = max(arg5, __worldLeft);
        var _visibleTop = max(arg6, __worldTop);
        var _visibleRight = min(arg7, __worldRight);
        var _visibleBottom = min(arg8, __worldBottom);
        
        if (_visibleLeft < _visibleRight && _visibleTop < _visibleBottom && __animMode == 0)
        {
            if (__active && __visible && __CanCaptureClickAnyEver() && arg4 != self && __HoverableNotInGroup(arg9))
            {
                var _distance = __HoverFreeSearchDistance(arg0, arg1, arg2, arg3);
                
                if (_distance < infinity)
                {
                    var _result = {};
                    _result.__struct = self;
                    _result.__distance = _distance;
                    array_push(arg10, _result);
                }
            }
            
            if (__captureClipChildren)
            {
                arg5 = _visibleLeft;
                arg6 = _visibleTop;
                arg7 = _visibleRight;
                arg8 = _visibleBottom;
            }
            
            var _i = 0;
            
            repeat (array_length(__children))
            {
                __children[_i].__HoverFreeSearchDebug(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
                _i++;
            }
        }
    };
    
    __type = arg0;
    __destroyed = false;
    __animMode = 0;
    __animTime = 0;
    animXOffset = 0;
    animYOffset = 0;
    animScale = 1;
    animAlpha = 1;
    animBlend = 16777215;
    animBlendAmount = 0;
    __init_performed = false;
    __directionalOverride = ["", "", "", ""];
    buildInLength = 60;
    __children = [];
    __isRoot = false;
    __fileOrigin = undefined;
    __callbackArray = array_create(UnknownEnum.Value_26);
    var _i = 0;
    
    repeat (array_length(__callbackArray))
    {
        __callbackArray[_i] = [undefined];
        _i++;
    }
    
    __captureClickDict = {};
    __captureClickArray = [];
    __captureCastDict = {};
    __captureCastArray = [];
    __getter = {};
    __setter = {};
    __captureClipChildren = false;
    __navigationRight = undefined;
    __navigationUp = undefined;
    __navigationLeft = undefined;
    __navigationDown = undefined;
    __localLeft = 0;
    __localTop = 0;
    __localRight = 0;
    __localBottom = 0;
    __drawOffsetX = 0;
    __drawOffsetY = 0;
    __drawLeft = 0;
    __drawTop = 0;
    __drawRight = 0;
    __drawBottom = 0;
    __worldOffsetX = 0;
    __worldOffsetY = 0;
    __worldLeft = 0;
    __worldTop = 0;
    __worldRight = 0;
    __worldBottom = 0;
    __dragOffsetX = 0;
    __dragOffsetY = 0;
    __active = true;
    __visible = true;
    __visible_nested_reactive = true;
    __stateHover = false;
    __stateDragging = false;
    __stateDragSuccess = false;
    __stateButtonDict = {};
    category = [];
    __parent = undefined;
    
    if (_global.__createReplaceTarget == undefined)
    {
        var _parent = uiCurrentOpen();
        
        if (_parent == undefined)
        {
            if (self.__type != "__uiClassRoot")
                __uiError("First UI element must be made using UiRoot / uiClassRoot");
            
            __address = "";
            identifier = __address + __type;
        }
        else
        {
            __address = _parent.identifier + "[" + string(array_length(_parent.__children)) + "] -> ";
            identifier = __address + __type;
            _parent.__ChildAdd(self, true);
        }
    }
    else
    {
        var _target = _global.__createReplaceTarget;
        _global.__createReplaceTarget = undefined;
        
        if (instanceof(_target) == "__uiClassRoot" && instanceof(self) != "__uiClassRoot")
            __uiError("Can't replace a root UI element with a non-root UI element");
        
        var _parent = _target.__parent;
        
        if (_parent == undefined)
            __uiError("Target \"", _target, "\" has no parent");
        
        var _index = __uiArrayFindIndex(_parent.__children, _target);
        
        if (_index == undefined)
            __uiError("Cannot find \"", _target, "\" on alleged parent \"", _parent, "\"");
        
        __address = _parent.identifier + "[" + string(_index) + "] -> ";
        identifier = _target.identifier;
        _parent.__ChildReplace(self, _index, true);
    }
    
    focusable = false;
    centreOnHover = true;
    hoverGroup = undefined;
    navigationLock = false;
    VariableBind("buildIn", function()
    {
        __uiError("Cannot get \"buildIn\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_25, arg0);
    });
    VariableBind("left", function()
    {
        return __localLeft;
    }, function(arg0)
    {
        __localLeft = __PercentageWidth(arg0);
    });
    VariableBind("top", function()
    {
        return __localTop;
    }, function(arg0)
    {
        __localTop = __PercentageHeight(arg0);
    });
    VariableBind("right", function()
    {
        return __localRight;
    }, function(arg0)
    {
        __localRight = __PercentageWidth(arg0);
    });
    VariableBind("bottom", function()
    {
        return __localBottom;
    }, function(arg0)
    {
        __localBottom = __PercentageHeight(arg0);
    });
    VariableBind("ltrb", function()
    {
        return [__localLeft, __localTop, __localRight, __localBottom];
    }, function(arg0)
    {
        __localLeft = __PercentageWidth(arg0[0]);
        __localTop = __PercentageHeight(arg0[1]);
        __localRight = __PercentageWidth(arg0[2]);
        __localBottom = __PercentageHeight(arg0[3]);
    });
    VariableBind("category", function()
    {
        return category;
    }, function(arg0)
    {
        if (is_string(arg0))
        {
            category = [arg0];
        }
        else
        {
            category = array_create(array_length(arg0));
            
            for (var i = 0; i < array_length(arg0); i++)
                category[i] = arg0[i];
        }
    });
    VariableBind("size", function()
    {
        return [__localRight - __localLeft, __localBottom - __localTop];
    }, function(arg0)
    {
        var _dX = __PercentageWidth(arg0[0]) - (__localRight - __localLeft);
        var _dY = __PercentageHeight(arg0[1]) - (__localBottom - __localTop);
        __localLeft -= (0.5 * _dX);
        __localTop -= (0.5 * _dY);
        __localRight += (0.5 * _dX);
        __localBottom += (0.5 * _dY);
    });
    VariableBind("x", function()
    {
        return 0.5 * (__localLeft + __localRight);
    }, function(arg0)
    {
        var _delta = __PercentageWidth(arg0) - (0.5 * (__localLeft + __localRight));
        __localLeft += _delta;
        __localRight += _delta;
    });
    VariableBind("y", function()
    {
        return 0.5 * (__localTop + __localBottom);
    }, function(arg0)
    {
        var _delta = __PercentageHeight(arg0) - (0.5 * (__localBottom + __localTop));
        __localTop += _delta;
        __localBottom += _delta;
    });
    VariableBind("xy", function()
    {
        return [0.5 * (__localLeft + __localRight), 0.5 * (__localTop + __localBottom)];
    }, function(arg0)
    {
        var _deltaX = __PercentageWidth(arg0[0]) - (0.5 * (__localLeft + __localRight));
        __localLeft += _deltaX;
        __localRight += _deltaX;
        var _deltaY = __PercentageHeight(arg0[1]) - (0.5 * (__localBottom + __localTop));
        __localTop += _deltaY;
        __localBottom += _deltaY;
    });
    VariableBind("tooltip_popup_text", function()
    {
        return __tooltip_popup_text;
    }, function(arg0)
    {
        __tooltip_popup_text = arg0;
    });
    VariableBind("width", function()
    {
        return __localRight - __localLeft;
    }, function(arg0)
    {
        var _delta = __PercentageWidth(arg0) - (__localRight - __localLeft);
        __localLeft -= (0.5 * _delta);
        __localRight += (0.5 * _delta);
    });
    VariableBind("height", function()
    {
        return __localBottom - __localTop;
    }, function(arg0)
    {
        var _delta = __PercentageHeight(arg0) - (__localBottom - __localTop);
        __localTop -= (0.5 * _delta);
        __localBottom += (0.5 * _delta);
    });
    VariableBind("worldLeft", function()
    {
        return __worldLeft;
    }, function(arg0)
    {
        arg0 = __PercentageWidth(arg0);
        __worldLeft = arg0;
        __localLeft = arg0 - (0.5 * (__worldLeft + __worldRight));
    });
    VariableBind("worldTop", function()
    {
        return __worldTop;
    }, function(arg0)
    {
        arg0 = __PercentageHeight(arg0);
        __worldTop = arg0;
        __localTop = arg0 - (0.5 * (__worldTop + __worldBottom));
    });
    VariableBind("worldRight", function()
    {
        return __worldRight;
    }, function(arg0)
    {
        arg0 = __PercentageWidth(arg0);
        __worldRight = arg0;
        __localRight = arg0 - (0.5 * (__worldLeft + __worldRight));
    });
    VariableBind("worldBottom", function()
    {
        return __worldBottom;
    }, function(arg0)
    {
        arg0 = __PercentageHeight(arg0);
        __worldBottom = arg0;
        __localBottom = arg0 - (0.5 * (__worldTop + __worldBottom));
    });
    VariableBind("worldX", function()
    {
        return 0.5 * (__worldLeft + __worldRight);
    }, function(arg0)
    {
        var _delta = __PercentageWidth(arg0) - (0.5 * (__worldLeft + __worldRight));
        __worldLeft += _delta;
        __worldRight += _delta;
        __localLeft += _delta;
        __localRight += _delta;
    });
    VariableBind("worldY", function()
    {
        return 0.5 * (__worldTop + __worldBottom);
    }, function(arg0)
    {
        var _delta = __PercentageHeight(arg0) - (0.5 * (__worldTop + __worldBottom));
        __worldTop += _delta;
        __worldBottom += _delta;
        __localTop += _delta;
        __localBottom += _delta;
    });
    VariableBind("drawLeft", function()
    {
        return __drawLeft;
    }, function(arg0)
    {
        __uiError("Cannot set \"drawLeft\"");
    });
    VariableBind("drawTop", function()
    {
        return __drawTop;
    }, function(arg0)
    {
        __uiError("Cannot set \"drawTop\"");
    });
    VariableBind("drawRight", function()
    {
        return __drawRight;
    }, function(arg0)
    {
        __uiError("Cannot set \"drawRight\"");
    });
    VariableBind("drawBottom", function()
    {
        return __drawBottom;
    }, function(arg0)
    {
        __uiError("Cannot set \"drawBottom\"");
    });
    VariableBind("drawX", function()
    {
        return 0.5 * (__drawLeft + __drawRight);
    }, function(arg0)
    {
        __uiError("Cannot set \"drawX\"");
    });
    VariableBind("drawY", function()
    {
        return 0.5 * (__drawTop + __drawBottom);
    }, function(arg0)
    {
        __uiError("Cannot set \"drawY\"");
    });
    VariableBind("drawWidth", function()
    {
        return __drawRight - __drawLeft;
    }, function(arg0)
    {
        __uiError("Cannot set \"drawWidth\"");
    });
    VariableBind("drawHeight", function()
    {
        return __drawBottom - __drawTop;
    }, function(arg0)
    {
        __uiError("Cannot set \"drawHeight\"");
    });
    VariableBind("navigationRight", function()
    {
        return __uiNullableRefResolve(__navigationRight);
    }, function(arg0)
    {
        __navigationRight = __uiNullableRefCreate(arg0);
    });
    VariableBind("navigationUp", function()
    {
        return __uiNullableRefResolve(__navigationUp);
    }, function(arg0)
    {
        __navigationUp = __uiNullableRefCreate(arg0);
    });
    VariableBind("navigationLeft", function()
    {
        return __uiNullableRefResolve(__navigationLeft);
    }, function(arg0)
    {
        __navigationLeft = __uiNullableRefCreate(arg0);
    });
    VariableBind("navigationDown", function()
    {
        return __uiNullableRefResolve(__navigationDown);
    }, function(arg0)
    {
        __navigationDown = __uiNullableRefCreate(arg0);
    });
    VariableBind("children", function()
    {
        return __children;
    }, function(arg0)
    {
        __uiError("Cannot set \"children\"");
    });
    VariableBind("parent", function()
    {
        return __parent;
    }, function(arg0)
    {
        __uiError("Cannot set \"parent\"");
    });
    VariableBind("active", function()
    {
        return __active;
    }, function(arg0)
    {
        var _oldValue = __active;
        __active = arg0;
        
        if (_oldValue && !__active)
        {
            with (__FindRoot())
            {
                if (__type != "__uiClassRoot")
                {
                    __uiTrace("Warning! Root element \"", self, "\" for \"", other, "\" is the wrong type (", __type, ")");
                }
                else
                {
                    if (__uiNullableRefResolve(__root.__hoverRef) == other)
                        __uiHoverSet(self, undefined, false);
                    
                    if (__uiNullableRefResolve(__root.__captureRef) == other)
                        __uiCaptureSet(self, undefined, undefined);
                }
            }
        }
    });
    VariableBind("visible", function()
    {
        return __visible;
    }, function(arg0)
    {
        var _oldValue = __visible;
        __visible = arg0;
        
        if (_oldValue && !__visible)
        {
            with (__FindRoot())
            {
                if (__type != "__uiClassRoot")
                {
                    __uiTrace("Warning! Root element \"", self, "\" for \"", other, "\" is the wrong type (", __type, ")");
                }
                else
                {
                    if (__uiNullableRefResolve(__root.__hoverRef) == other)
                        __uiHoverSet(self, undefined, false);
                    
                    if (__uiNullableRefResolve(__root.__captureRef) == other)
                        __uiCaptureSet(self, undefined, undefined);
                }
            }
        }
    });
    VariableBind("press", function()
    {
        __uiError("Cannot get \"press\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_4, arg0);
    });
    VariableBind("hold", function()
    {
        __uiError("Cannot get \"hold\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_5, arg0);
    });
    VariableBind("release", function()
    {
        __uiError("Cannot get \"release\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_6, arg0);
    });
    VariableBind("click", function()
    {
        __uiError("Cannot get \"click\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_7, arg0);
    });
    VariableBind("canCapture", function()
    {
        __uiError("Cannot get \"canCapture\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_8, arg0);
    });
    VariableBind("captureClick", function()
    {
        __uiError("Cannot get \"captureClick\"");
        exit;
    }, function(arg0)
    {
        if (!is_array(arg0))
            arg0 = [arg0];
        
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            var _value = arg0[_i];
            
            if (!variable_struct_exists(__captureClickDict, _value))
            {
                array_push(__captureClickArray, _value);
                variable_struct_set(__captureClickDict, _value, true);
            }
            
            _i++;
        }
    });
    VariableBind("captureCast", function()
    {
        __uiError("Cannot get \"captureCast\"");
        exit;
    }, function(arg0)
    {
        if (!is_array(arg0))
            arg0 = [arg0];
        
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            var _value = arg0[_i];
            
            if (!variable_struct_exists(__captureCastDict, _value))
            {
                array_push(__captureCastArray, _value);
                variable_struct_set(__captureCastDict, _value, true);
            }
            
            _i++;
        }
    });
    VariableBind("enter", function()
    {
        __uiError("Cannot get \"enter\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_0, arg0);
    });
    VariableBind("over", function()
    {
        __uiError("Cannot get \"over\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_1, arg0);
    });
    VariableBind("leave", function()
    {
        __uiError("Cannot get \"leave\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_2, arg0);
    });
    VariableBind("canHover", function()
    {
        __uiError("Cannot get \"canHover\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_3, arg0);
    });
    VariableBind("init", function()
    {
        __uiError("Cannot get \"init\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_10, arg0);
    });
    VariableBind("step", function()
    {
        __uiError("Cannot get \"step\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_11, arg0);
    });
    VariableBind("draw", function()
    {
        __uiError("Cannot get \"draw\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_12, arg0);
    });
    VariableBind("draw_end", function()
    {
        __uiError("Cannot get \"draw_end\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_13, arg0);
    });
    VariableBind("onClose", function()
    {
        __uiError("Cannot get \"onClose\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_14, arg0);
    });
    VariableBind("push", function()
    {
        __uiError("Cannot get \"push\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_15, arg0);
    });
    VariableBind("parentChanged", function()
    {
        __uiError("Cannot get \"parentChanged\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_17, arg0);
    });
    VariableBind("childrenChanged", function()
    {
        __uiError("Cannot get \"childrenChanged\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_16, arg0);
    });
    VariableBind("canReceiveDnD", function()
    {
        __uiError("Cannot get \"canReceiveDnD\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_18, arg0);
    });
    VariableBind("onReceiveDnD", function()
    {
        __uiError("Cannot get \"onReceiveDnD\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_19, arg0);
    });
    VariableBind("onPlaceDnD", function()
    {
        __uiError("Cannot get \"onPlaceDnD\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_20, arg0);
    });
    VariableBind("layout", function()
    {
        __uiError("Cannot get \"layout\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_21, arg0);
    });
    VariableBind("layoutCheck", function()
    {
        __uiError("Cannot get \"layoutCheck\"");
        exit;
    }, function(arg0)
    {
        __CallbackSetFromCatspeak(UnknownEnum.Value_22, arg0);
    });
    VariableBind("layoutVerticalList", function()
    {
        __uiError("Cannot get \"layoutVerticalList\"");
        exit;
    }, function(arg0)
    {
        LayoutAsVerticalList(arg0[0], arg0[1]);
    });
    VariableBind("layoutHorizontalList", function()
    {
        __uiError("Cannot get \"layoutHorizontalList\"");
        exit;
    }, function(arg0)
    {
        var _alignment = arg0[0];
        var _spacing = arg0[1];
        __layout = 
        {
            __type: "horizontal list",
            __alignment: _alignment,
            __spacing: _spacing
        };
        CallbackSetLayoutExecute(function()
        {
            var _x = 0;
            var _spacing = __layout.__spacing;
            
            switch (__layout.__alignment)
            {
                case "top":
                    var _i = 0;
                    
                    repeat (array_length(__children))
                    {
                        var _child = __children[_i];
                        _child.Set("x", _x + (0.5 * (_child.__localRight - _child.__localLeft)));
                        _child.Set("y", 0.5 * (_child.__localBottom - _child.__localTop));
                        _x += ((_child.__localRight - _child.__localLeft) + _spacing);
                        _i++;
                    }
                    
                    break;
                
                case "middle":
                    var _y = 0.5 * (__localBottom - __localTop);
                    var _i = 0;
                    
                    repeat (array_length(__children))
                    {
                        var _child = __children[_i];
                        _child.Set("x", _x + (0.5 * (_child.__localRight - _child.__localLeft)));
                        _child.Set("y", _y);
                        _x += ((_child.__localRight - _child.__localLeft) + _spacing);
                        _i++;
                    }
                    
                    break;
                
                case "bottom":
                    var _y = __localBottom - __localTop;
                    var _i = 0;
                    
                    repeat (array_length(__children))
                    {
                        var _child = __children[_i];
                        _child.Set("x", _x + (0.5 * (_child.__localRight - _child.__localLeft)));
                        _child.Set("y", _y - (0.5 * (_child.__localBottom - _child.__localTop)));
                        _x += ((_child.__localRight - _child.__localLeft) + _spacing);
                        _i++;
                    }
                    
                    break;
                
                default:
                    __uiError("Unknown vertical list alignment \"", __alignment, "\"");
                    break;
            }
        });
        CallbackSetLayoutCheck(function()
        {
            return false;
        });
    });
    VariableBind("layoutGrid", function()
    {
        __uiError("Cannot get \"layoutGrid\"");
        exit;
    }, function(arg0)
    {
        var _cellWidth = arg0[0];
        var _cellHeight = arg0[1];
        __layout = 
        {
            __type: "grid",
            __cellWidth: _cellWidth,
            __cellHeight: _cellHeight
        };
        CallbackSetLayoutExecute(function()
        {
            var _maxWidth = __localRight - __localLeft;
            var _cellWidth = __layout.__cellWidth;
            var _cellHeight = __layout.__cellHeight;
            var _x = _cellWidth / 2;
            var _y = _cellHeight / 2;
            var _i = 0;
            
            repeat (array_length(__children))
            {
                var _child = __children[_i];
                _child.Set("x", _x);
                _child.Set("y", _y);
                _x += _cellWidth;
                
                if (_x > _maxWidth)
                {
                    _x = _cellWidth / 2;
                    _y += _cellHeight;
                }
                
                _i++;
            }
        });
        CallbackSetLayoutCheck(function()
        {
            return false;
        });
    });
    VariableBind("childMinLeft", function()
    {
        if (array_length(__children) <= 0)
            return __localLeft;
        
        var _value = __children[0].__localLeft;
        var _i = 1;
        
        repeat (array_length(__children) - 1)
        {
            _value = min(_value, __children[_i].__localLeft);
            _i++;
        }
        
        return _value;
    }, function(arg0)
    {
        __uiError("Cannot set \"childMinLeft\"");
    });
    VariableBind("childMinTop", function()
    {
        if (array_length(__children) <= 0)
            return __localTop;
        
        var _value = __children[0].__localTop;
        var _i = 1;
        
        repeat (array_length(__children) - 1)
        {
            _value = min(_value, __children[_i].__localTop);
            _i++;
        }
        
        return _value;
    }, function(arg0)
    {
        __uiError("Cannot set \"childMinTop\"");
    });
    VariableBind("childMaxRight", function()
    {
        if (array_length(__children) <= 0)
            return __localRight;
        
        var _value = __children[0].__localRight;
        var _i = 1;
        
        repeat (array_length(__children) - 1)
        {
            _value = max(_value, __children[_i].__localRight);
            _i++;
        }
        
        return _value;
    }, function(arg0)
    {
        __uiError("Cannot set \"childMaxRight\"");
    });
    VariableBind("childMaxBottom", function()
    {
        if (array_length(__children) <= 0)
            return __localBottom;
        
        var _value = __children[0].__localBottom;
        var _i = 1;
        
        repeat (array_length(__children) - 1)
        {
            _value = max(_value, __children[_i].__localBottom);
            _i++;
        }
        
        return _value;
    }, function(arg0)
    {
        __uiError("Cannot set \"childMaxBottom\"");
    });
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29
}
