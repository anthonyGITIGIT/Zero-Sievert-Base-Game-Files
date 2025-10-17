function uiDebugShowSkeleton(arg0)
{
    static _debugStruct = __uiGlobal().__debug;
    
    _debugStruct.__showSkeleton = arg0;
    __uiTrace("Set DebugShowSkeleton = ", arg0);
}
