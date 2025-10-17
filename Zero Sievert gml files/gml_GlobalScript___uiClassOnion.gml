function __uiClassOnion(arg0) constructor
{
    static _global = __uiGlobal();
    
    static toString = function()
    {
        return "<onion " + __name + ">";
    };
    
    static SetLTRB = function(arg0, arg1, arg2, arg3)
    {
        __worldLeft = arg0;
        __worldTop = arg1;
        __worldRight = arg2;
        __worldBottom = arg3;
        return self;
    };
    
    static Draw = function()
    {
        var _oldOnion = _global.__currentOnion;
        _global.__currentOnion = self;
        var _i = array_length(__layerArray) - 1;
        
        repeat (array_length(__layerArray))
        {
            var _layer = __layerArray[_i];
            _global.__currentOnionLayer = _layer.__name;
            uiDraw(_layer.__struct);
            _i--;
        }
        
        _global.__currentOnion = _oldOnion;
    };
    
    static Clear = function()
    {
        var _i = 0;
        
        repeat (array_length(__layerArray))
        {
            with (__layerArray[_i])
            {
                if (is_struct(__struct))
                    __struct.Destroy();
            }
            
            _i++;
        }
        
        array_resize(__layerArray, 0);
    };
    
    static HasInputReceiver = function()
    {
        var _i = 0;
        
        repeat (array_length(__layerArray))
        {
            if (__layerArray[_i].__sensitivity > 0)
                return true;
            
            _i++;
        }
        
        return false;
    };
    
    static HasModal = function()
    {
        var _i = 0;
        
        repeat (array_length(__layerArray))
        {
            if (__layerArray[_i].__sensitivity > 1)
                return true;
            
            _i++;
        }
        
        return false;
    };
    
    static OverwriteNext = function(arg0 = true)
    {
        __overwriteNext = arg0;
        return self;
    };
    
    static OverwriteAlways = function(arg0)
    {
        __overwriteAlways = arg0;
        return self;
    };
    
    static __LayerLazyCreate = function(arg0)
    {
        if (is_string(arg0))
            return uiFileExecute(arg0);
        else if (!is_method(arg0) && is_struct(arg0))
            return arg0;
        
        __uiError("Unsupported datatype for layer root (", typeof(arg0), ")");
    };
    
    static LayerAdd = function(arg0, arg1, arg2, arg3 = 2)
    {
        if (arg1 == undefined)
            arg1 = __uiGenerateUUID4String(false);
        
        var _index = GetIndex(arg1);
        
        if (_index != undefined)
        {
            if (__overwriteNext || __overwriteAlways)
                array_delete(__layerArray, _index, 1);
            else
                __uiError("Layer \"", arg1, "\" already exists for ", self);
        }
        
        __overwriteNext = false;
        var _i = 0;
        
        repeat (array_length(__layerArray))
        {
            if (__layerArray[_i].__priority <= arg2)
                break;
            
            _i++;
        }
        
        var _layer = new __uiClassOnionLayer(__LayerLazyCreate(arg0), arg1, arg2, arg3);
        array_insert(__layerArray, _i, _layer);
        __uiTrace("Added ", _layer, ", priority=", arg2, ", sensitivity=", arg3);
        return arg1;
    };
    
    static LayerAddTop = function(arg0, arg1, arg2 = 2, arg3 = 0)
    {
        if (arg1 == undefined)
            arg1 = __uiGenerateUUID4String(false);
        
        var _priority = (array_length(__layerArray) == 0) ? 0 : (__layerArray[0].__priority + arg3);
        var _layer = new __uiClassOnionLayer(__LayerLazyCreate(arg0), arg1, _priority, arg2);
        array_insert(__layerArray, 0, _layer);
        __uiTrace("Added ", _layer, " to the top, priority=", _priority, ", sensitivity=", arg2);
        return arg1;
    };
    
    static LayerAddOver = function(arg0, arg1, arg2, arg3 = 2)
    {
        if (arg1 == undefined)
            arg1 = __uiGenerateUUID4String(false);
        
        var _targetIndex = GetIndex(arg2);
        
        if (_targetIndex == undefined)
            __uiError("Target layer \"", arg2, "\" doesn't exist for ", self);
        
        var _targetLayer = __layerArray[_targetIndex];
        var _layer = new __uiClassOnionLayer(__LayerLazyCreate(arg0), arg1, _targetLayer.__priority, arg3);
        array_insert(__layerArray, _targetIndex, _layer);
        __uiTrace("Added ", _layer, " over ", _targetLayer, ", priority=", _targetLayer.__priority, ", sensitivity=", arg3);
        return arg1;
    };
    
    static TooltipEnsure = function(arg0, arg1, arg2, arg3 = 1)
    {
        if (arg1 == undefined)
            __uiError("Tooltips must be given a layer name");
        
        var _layerStruct = __GetLayer(arg1);
        
        if (_layerStruct != undefined)
        {
            var _layerRootStruct = _layerStruct.__struct;
            
            if (_layerRootStruct.__fileOrigin == arg0)
            {
                _layerStruct.__VolatileKeepAlive();
                return LayerMove(arg1, arg2);
            }
            else
            {
                __uiTrace("Tooltip filename for layer \"", arg1, "\" has changed from \"", _layerRootStruct.__fileOrigin, "\" to \"", arg0, "\"");
            }
        }
        
        var _return = OverwriteNext().LayerAdd(__LayerLazyCreate(arg0), arg1, arg2, arg3);
        __LayerMarkTooltip(arg1);
        return _return;
    };
    
    static TooltipEnsureTop = function(arg0, arg1, arg2 = 1, arg3 = 0)
    {
        if (arg1 == undefined)
            __uiError("Tooltips must be given a layer name");
        
        var _layerStruct = __GetLayer(arg1);
        
        if (_layerStruct != undefined)
        {
            var _layerRootStruct = _layerStruct.__struct;
            
            if (_layerRootStruct.__fileOrigin == arg0)
            {
                _layerStruct.__VolatileKeepAlive();
                return LayerMoveTop(arg1, arg3);
            }
            else
            {
                __uiTrace("Tooltip filename for layer \"", arg1, "\" has changed from \"", _layerRootStruct.__fileOrigin, "\" to \"", arg0, "\"");
            }
        }
        
        var _return = OverwriteNext().LayerAddTop(__LayerLazyCreate(arg0), arg1, arg2, arg3);
        __LayerMarkTooltip(arg1);
        return _return;
    };
    
    static TooltipEnsureOver = function(arg0, arg1, arg2, arg3 = 1)
    {
        if (arg1 == undefined)
            __uiError("Tooltips must be given a layer name");
        
        var _layerStruct = __GetLayer(arg1);
        
        if (_layerStruct != undefined)
        {
            var _layerRootStruct = _layerStruct.__struct;
            
            if (_layerRootStruct.__fileOrigin == arg0)
            {
                _layerStruct.__VolatileKeepAlive();
                return LayerMoveOver(arg1, arg2);
            }
            else
            {
                __uiTrace("Tooltip filename for layer \"", arg1, "\" has changed from \"", _layerRootStruct.__fileOrigin, "\" to \"", arg0, "\"");
            }
        }
        
        var _return = OverwriteNext().LayerAddOver(__LayerLazyCreate(arg0), arg1, arg2, arg3);
        __LayerMarkTooltip(arg1);
        return _return;
    };
    
    static __LayerMarkTooltip = function(arg0)
    {
        __GetLayer(arg0).__VolatileMark();
    };
    
    static LayerMove = function(arg0, arg1)
    {
        var _index = GetIndex(arg0);
        
        if (_index == undefined)
            __uiError("Layer \"", arg0, "\" doesn't exist for ", self);
        
        var _layer = __layerArray[_index];
        _layer.__priority = arg1;
        array_delete(__layerArray, _index, 1);
        var _i = 0;
        
        repeat (array_length(__layerArray))
        {
            if (__layerArray[_i].__priority <= arg1)
                break;
            
            _i++;
        }
        
        array_insert(__layerArray, _i, _layer);
        __uiTrace("Moved ", _layer, " to priority=", arg1);
    };
    
    static LayerMoveTop = function(arg0, arg1 = 0)
    {
        var _index = GetIndex(arg0);
        
        if (_index == undefined)
            __uiError("Layer \"", arg0, "\" doesn't exist for ", self);
        
        if (_index == 0)
            return self;
        
        var _layer = __layerArray[_index];
        _layer.__priority = __layerArray[0].__priority + arg1;
        array_delete(__layerArray, _index, 1);
        array_insert(__layerArray, 0, _layer);
        __uiTrace("Moved ", _layer, " to the top, priority=", _layer.__priority);
    };
    
    static LayerMoveOver = function(arg0, arg1)
    {
        if (arg0 == arg1)
            exit;
        
        var _currentIndex = GetIndex(arg0);
        
        if (_currentIndex == undefined)
            __uiError("Layer \"", arg0, "\" doesn't exist for ", self);
        
        var _targetIndex = GetIndex(arg1);
        
        if (_targetIndex == undefined)
            __uiError("Target layer \"", arg1, "\" doesn't exist for ", self);
        
        if (_currentIndex == (_targetIndex - 1))
            exit;
        
        var _layer = __layerArray[_currentIndex];
        var _targetLayer = __layerArray[_cur_targetIndexrentIndex];
        _layer.__priority = _targetLayer.__priority;
        array_delete(__layerArray, _currentIndex, 1);
        array_insert(__layerArray, _targetIndex, _layer);
        __uiTrace("Moved ", _layer, " over ", _targetLayer, ", priority=", _layer.__priority);
    };
    
    static LayerDelete = function(arg0)
    {
        var _index = GetIndex(arg0);
        
        if (_index == undefined)
            exit;
        
        var _layer = __layerArray[_index];
        array_delete(__layerArray, _index, 1);
        
        with (_layer)
        {
            if (is_struct(__struct))
                __struct.Destroy();
        }
        
        __uiTrace("Deleted ", _layer);
    };
    
    static LayerSensitivity = function(arg0, arg1)
    {
        var _layer = __GetLayer(arg0);
        
        if (_layer == undefined)
            __uiError("Layer \"", arg0, "\" doesn't exist for ", self);
        
        _layer.__sensitivity = arg1;
    };
    
    static __GetLayer = function(arg0)
    {
        var _index = GetIndex(arg0);
        return (_index == undefined) ? undefined : __layerArray[_index];
    };
    
    static GetLayerCount = function()
    {
        return array_length(__layerArray);
    };
    
    static LayerExists = function(arg0)
    {
        return GetStruct(arg0) != undefined;
    };
    
    static LayerFindName = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(__layerArray))
        {
            if (__layerArray[_i].__struct == arg0)
                return __layerArray[_i].__name;
            
            _i++;
        }
        
        return undefined;
    };
    
    static GetIndex = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(__layerArray))
        {
            if (__layerArray[_i].__name == arg0)
                return _i;
            
            _i++;
        }
        
        return undefined;
    };
    
    static GetStruct = function(arg0)
    {
        var _layer = __GetLayer(arg0);
        
        if (_layer == undefined)
            return undefined;
        
        return _layer.__struct;
    };
    
    static GetPriority = function(arg0)
    {
        var _layer = __GetLayer(arg0);
        
        if (_layer == undefined)
            return undefined;
        
        return _layer.__priority;
    };
    
    static GetSensitivity = function(arg0)
    {
        var _layer = __GetLayer(arg0);
        
        if (_layer == undefined)
            return undefined;
        
        return _layer.__sensitivity;
    };
    
    static GetTopLayer = function()
    {
        return (array_length(__layerArray) <= 0) ? undefined : __layerArray[0];
    };
    
    static InputPointer = function(arg0, arg1)
    {
        InputSetMode("pointer");
        __inputX = arg0;
        __inputY = arg1;
        return self;
    };
    
    static InputDirection = function(arg0, arg1, arg2 = false, arg3 = 0.3, arg4 = false)
    {
        InputSetMode("directional");
        __inputX = arg0;
        __inputY = arg1;
        __inputRetrigger = arg2;
        __inputThreshold = arg3;
        __inputSkipGroup = arg4;
        return self;
    };
    
    static InputButtonTarget = function(arg0, arg1)
    {
        var _buttonData = variable_struct_get(__inputButtonDict, arg0);
        
        if (_buttonData == undefined)
        {
            _buttonData = 
            {
                __type: "click",
                __name: arg0,
                __state: arg1
            };
            variable_struct_set(__inputButtonDict, arg0, _buttonData);
            array_push(__inputButtonArray, _buttonData);
        }
        else
        {
            _buttonData.__state = arg1;
        }
        
        return self;
    };
    
    static InputButtonCast = function(arg0, arg1)
    {
        var _buttonData = variable_struct_get(__inputButtonDict, arg0);
        
        if (_buttonData == undefined)
        {
            _buttonData = 
            {
                __type: "cast",
                __name: arg0,
                __state: arg1
            };
            variable_struct_set(__inputButtonDict, arg0, _buttonData);
            array_push(__inputButtonArray, _buttonData);
        }
        else
        {
            _buttonData.__state = arg1;
        }
        
        return self;
    };
    
    static InputGetMode = function()
    {
        return __inputCursorMode;
    };
    
    static InputSetMode = function(arg0)
    {
        if (arg0 == "directional" && __inputCursorMode != "directional")
        {
            uiTrace("Highlighting first element");
            var _i = 0;
            
            repeat (array_length(__layerArray))
            {
                __layerArray[_i].__HoverFirst(true);
                _i++;
            }
        }
        
        if (arg0 != __inputCursorMode)
        {
            __inputCursorMode = arg0;
            __uiTrace("Set input mode to ", __inputCursorMode);
        }
    };
    
    static Step = function()
    {
        var _layerArray = array_create(array_length(__layerArray), undefined);
        array_copy(_layerArray, 0, __layerArray, 0, array_length(__layerArray));
        var _oldOnion = _global.__currentOnion;
        _global.__currentOnion = self;
        var _i = 0;
        
        repeat (array_length(_layerArray))
        {
            var _layer = _layerArray[_i];
            
            if (_layer.__sensitivity > 0)
            {
                _global.__currentOnionLayer = _layer.__name;
                var _struct = _layer.__struct;
                
                switch (__inputCursorMode)
                {
                    case "pointer":
                        uiInputPointer(_struct, __inputX, __inputY);
                        break;
                    
                    case "directional":
                        if (!_layer.__HoverDirectionalOverrideCheck(__inputX, __inputY))
                        {
                            _layer.__HoverFirst(true);
                            uiInputDirection(_struct, __inputX, __inputY, __inputRetrigger, __inputThreshold, __inputSkipGroup);
                        }
                        
                        break;
                    
                    default:
                        __uiError("Input mode \"", __inputCursorMode, "\" for ", self, " not recognised");
                        break;
                }
                
                var _j = 0;
                
                repeat (array_length(__inputButtonArray))
                {
                    var _buttonData = __inputButtonArray[_j];
                    
                    switch (_buttonData.__type)
                    {
                        case "click":
                            uiInputButtonClick(_struct, _buttonData.__name, _buttonData.__state, __inputCursorMode == "directional");
                            break;
                        
                        case "cast":
                            uiInputButtonCast(_struct, _buttonData.__name, _buttonData.__state, __inputCursorMode == "directional");
                            break;
                        
                        default:
                            __uiError("Button mode \"", _buttonData.__type, "\" for button \"", _buttonData.__name, "\" for ", self, " not recognised");
                            break;
                    }
                    
                    _j++;
                }
                
                if (_layer.__sensitivity > 1)
                {
                    _i++;
                    break;
                }
            }
            
            _i++;
        }
        
        repeat (array_length(_layerArray) - _i)
        {
            var _layer = _layerArray[_i];
            
            if (_layer.__sensitivity > 0)
            {
                _global.__currentOnionLayer = _layer.__name;
                uiInputButtonClearAll(_layer.__struct, __inputCursorMode == "pointer");
            }
            
            _i++;
        }
        
        _i = 0;
        
        repeat (array_length(_layerArray))
        {
            _layerArray[_i].__Step();
            _i++;
        }
        
        _i = 0;
        
        repeat (array_length(__layerArray))
        {
            var _layer = __layerArray[_i];
            
            if (_layer.__destroyed)
                array_delete(__layerArray, _i, 1);
            else
                _i++;
        }
        
        __inputRetrigger = false;
        
        if (__inputCursorMode == "directional")
        {
            __inputX = 0;
            __inputY = 0;
        }
        
        _i = 0;
        
        repeat (array_length(__inputButtonArray))
        {
            __inputButtonArray[_i].__state = false;
            _i++;
        }
        
        _global.__currentOnion = _oldOnion;
    };
    
    __name = arg0 ?? __uiGenerateUUID4String();
    __worldLeft = 0;
    __worldTop = 0;
    __worldRight = display_get_gui_width();
    __worldBottom = display_get_gui_height();
    __overwriteNext = false;
    __overwriteAlways = false;
    __layerArray = [];
    __inputCursorMode = "pointer";
    __inputX = 0;
    __inputY = 0;
    __inputRetrigger = false;
    __inputThreshold = 0.2;
    __inputSkipGroup = false;
    __inputButtonArray = [];
    __inputButtonDict = {};
    __uiTrace("Created ", self);
}
