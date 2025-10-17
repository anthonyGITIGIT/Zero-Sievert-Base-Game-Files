function __uiRootStackPop()
{
    static _rootStack = __uiGlobal().__rootStack;
    
    if (array_length(_rootStack) > 1)
        array_delete(_rootStack, 0, 1);
}
