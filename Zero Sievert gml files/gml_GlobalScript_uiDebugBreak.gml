function uiDebugBreak()
{
    if (debug_mode)
        __uiTrace("uiDebugBreak() ", debug_get_callstack());
}
