function uiDebugShowFreeNav(arg0)
{
    static _debugStruct = __uiGlobal().__debug;
    
    _debugStruct.__showFreeNav = arg0;
    __uiTrace("Set DebugShowFreeNav = ", arg0);
}
