function __uiContextStackSize()
{
    static _contextStack = __uiGlobal().__contextStack;
    
    return array_length(_contextStack);
}
