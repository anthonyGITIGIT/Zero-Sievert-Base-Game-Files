function __uiRootStackPush(arg0)
{
    static _rootStack = __uiGlobal().__rootStack;
    
    array_insert(_rootStack, 0, arg0);
}
