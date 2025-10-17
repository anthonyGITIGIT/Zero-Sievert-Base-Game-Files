function __uiContextStackPush(arg0)
{
    static _contextStack = __uiGlobal().__contextStack;
    
    array_insert(_contextStack, 0, arg0);
}
