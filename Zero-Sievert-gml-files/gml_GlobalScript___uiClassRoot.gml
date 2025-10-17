uiAddBoxType("UiRoot", __uiClassRoot, false);

function __uiClassRoot() : __uiClassCommon() constructor
{
    static ReplaceFromFile = function(arg0)
    {
        __uiTrace("Reloading \"", self, "\" (file = \"", arg0, "\")");
        var _oldCreateHijack = _global.__createHijack;
        _global.__createHijack = self;
        ChildrenClear();
        __uiFileEnsure(arg0).__Execute();
        _global.__createHijack = _oldCreateHijack;
    };
    
    __isRoot = true;
    __root = 
    {
        __pointerX: uiPointerGetX(),
        __pointerY: uiPointerGetY(),
        __pointerStartX: 0,
        __pointerStartY: 0,
        __hoverRef: undefined,
        __lastHoverRef: undefined,
        __draggingRef: undefined,
        __captureFocus: false,
        __inputDirectionState: false,
        __captureRef: undefined,
        __captureButtonName: undefined,
        __captureTime: infinity,
        __captureLocalX: 0,
        __captureLocalY: 0,
        __stateButtonDict: {},
        __stateButtonConsumeDict: {}
    };
    array_push(_global.__rootElementArray, weak_ref_create(self));
}
