function uiCurrentOpen()
{
    static _contextStack = __uiGlobal().__contextStack;
    
    return _contextStack[0];
}
