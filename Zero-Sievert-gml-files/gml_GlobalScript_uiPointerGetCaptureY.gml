function uiPointerGetCaptureY(arg0 = undefined)
{
    if (arg0 == undefined)
        arg0 = __uiRootStackTop();
    
    return is_struct(arg0) ? arg0.__root.__captureLocalY : 0;
}
