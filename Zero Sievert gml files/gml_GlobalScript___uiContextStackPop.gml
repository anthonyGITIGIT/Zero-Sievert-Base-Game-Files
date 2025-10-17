function __uiContextStackPop()
{
    static _contextStack = __uiGlobal().__contextStack;
    
    if (array_length(_contextStack) > 1)
        array_delete(_contextStack, 0, 1);
}
