function __uiRootStackTop()
{
    static _rootStack = __uiGlobal().__rootStack;
    
    return _rootStack[0];
}
