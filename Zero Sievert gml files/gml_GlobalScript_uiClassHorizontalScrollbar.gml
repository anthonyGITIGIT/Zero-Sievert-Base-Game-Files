uiAddBoxType("UiHorizontalScrollbar", uiClassHorizontalScrollbar, false);

function uiClassHorizontalScrollbar() : uiClassHorizontalSlider() constructor
{
    __binding = undefined;
    VariableBind("value", function()
    {
        return value;
    }, function(arg0)
    {
        __uiError("Cannot set \"value\" for scrollbars (set .scrollX for the scrollbox instead)");
    });
    VariableBind("valueMin", function()
    {
        return valueMin;
    }, function(arg0)
    {
        __uiError("Cannot set .valueMin for scrollbars (set .scrollXMin for the scrollbox instead)");
    });
    VariableBind("valueMax", function()
    {
        return valueMax;
    }, function(arg0)
    {
        __uiError("Cannot set .valueMax for scrollbars (set .scrollXMax for the scrollbox instead)");
    });
    VariableBind("binding", function()
    {
        return __binding;
    }, function(arg0)
    {
        if (!is_struct(arg0))
            __uiError("Must bind to a UiScrollBox (type=", typeof(arg0), ")");
        
        if (typeof(arg0) != "UiScrollBox" || typeof(arg0) != "UiScrollBoxCredits" || typeof(arg0) != "UiScrollBoxQuests")
        {
            try
            {
                var _ = arg0.__captureClipChildren;
                _ = arg0.__surface;
                _ = arg0.__scrollDragOffsetX;
                _ = arg0.__scrollDragOffsetY;
            }
            catch (_error)
            {
                __uiError("Must bind to a UiScrollBox (type=", typeof(arg0), ")");
            }
        }
        
        __binding = arg0;
        value = arg0.scrollX;
        valueMin = arg0.scrollXMin;
        valueMax = arg0.scrollXMax;
    });
    CallbackSetOnValueChange(function(arg0)
    {
        if (__binding != undefined)
            __binding.scrollX = arg0;
    });
    CallbackSetValueUpdate(function()
    {
        if (__binding != undefined)
        {
            valueMin = __binding.scrollXMin;
            valueMax = __binding.scrollXMax;
            return __binding.scrollX;
        }
    });
}
