function uiDebugRelaxedSprites(arg0)
{
    static _debugStruct = __uiGlobal().__debug;
    
    _debugStruct.__relaxedSprites = arg0;
    __uiTrace("Set DebugRelaxedSprites = ", arg0);
}
