function uiStep(arg0)
{
    if (!is_struct(arg0))
        exit;
    
    __uiRootStackPush(arg0);
    
    with (arg0)
        __Step(0, 0, true);
    
    __uiRootStackPop();
}
