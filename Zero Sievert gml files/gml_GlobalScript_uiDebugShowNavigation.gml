function uiDebugShowNavigation(arg0)
{
    static _debugStruct = __uiGlobal().__debug;
    
    _debugStruct.__showNavigationGraph = arg0;
    __uiTrace("Set DebugShowNavigation = ", arg0);
}
