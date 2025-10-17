function uiDebugShowPointer(arg0)
{
    static _debugStruct = __uiGlobal().__debug;
    
    _debugStruct.__showPointer = arg0;
    __uiTrace("Set DebugShowPointer = ", arg0);
}
