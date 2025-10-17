uiAddBoxType("UiVerticalScrollbar", uiClassVerticalScrollbar, false);

function uiClassVerticalScrollbar() : uiClassVerticalSlider() constructor
{
    __binding = undefined;
    VariableBind("value", function()
    {
        return value;
    }, function(arg0)
    {
        __uiError("Cannot set \"value\" for scrollbars (set .scrollY for the scrollbox instead)");
    });
    VariableBind("valueMin", function()
    {
        return valueMin;
    }, function(arg0)
    {
        __uiError("Cannot set .valueMin for scrollbars (set .scrollYMin for the scrollbox instead)");
    });
    VariableBind("valueMax", function()
    {
        return valueMax;
    }, function(arg0)
    {
        __uiError("Cannot set .valueMax for scrollbars (set .scrollYMax for the scrollbox instead)");
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
        value = arg0.scrollY;
        valueMin = arg0.scrollYMin;
        valueMax = arg0.scrollYMax;
        pushIncrement = (valueMax - valueMin) / 5;
    });
    CallbackSetOnValueChange(function(arg0)
    {
        if (__binding != undefined)
            __binding.scrollY = arg0;
    });
    CallbackSetValueUpdate(function()
    {
        if (__binding != undefined)
        {
            valueMin = __binding.scrollYMin;
            valueMax = __binding.scrollYMax;
            return __binding.scrollY;
        }
    });
}
