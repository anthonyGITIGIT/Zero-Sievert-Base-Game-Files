uiAddBoxType("UiDnD", uiClassDnD, false);

function uiClassDnD() : uiClassButton() constructor
{
    static AutoPlace = function(arg0, arg1 = true, arg2 = false)
    {
        var _position = arg0.FindEmptyPlace(self, arg1, arg2);
        
        if (_position == undefined || _position == true)
        {
            if (_position == true)
                return false;
            
            return undefined;
        }
        
        ParentChange(arg0);
        Set("x", _position[0]);
        Set("y", _position[1]);
        
        if (arg2)
        {
            if (_position[2] == 1)
                Set("rotation", (Get("rotation") == 0) ? 90 : 0);
        }
        
        ui_inventory_check_weight();
        return true;
    };
    
    static __SetDragOffset = function()
    {
        __dragOffsetX = uiPointerGetX() - uiPointerGetCaptureX() - (0.5 * (__localLeft + __localRight));
        __dragOffsetY = uiPointerGetY() - uiPointerGetCaptureY() - (0.5 * (__localTop + __localBottom));
    };
    
    focusable = true;
    rotation = 0;
    CallbackSetCanHover(function()
    {
        return !GetAnyDragging();
    });
    CallbackSetButtonStart(function(arg0)
    {
        uiCallInherited();
        
        if (arg0 == "action")
        {
            __uiDraggingSet(__uiRootStackTop(), self);
            __SetDragOffset();
        }
    });
    CallbackSetButton(function(arg0)
    {
        uiCallInherited();
        
        if (arg0 == "action")
            __SetDragOffset();
    });
    CallbackSetButtonEnd(function(arg0)
    {
        uiCallInherited();
        
        if (arg0 == "action")
            __uiDraggingSet(__uiRootStackTop(), undefined);
    });
}
