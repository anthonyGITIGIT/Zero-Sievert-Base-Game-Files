function uiInputButtonConsume(arg0, arg1)
{
    if (!is_struct(arg0))
        exit;
    
    with (arg0)
    {
        variable_struct_remove(__root.__stateButtonDict, arg1);
        variable_struct_set(__root.__stateButtonConsumeDict, arg1, true);
    }
}
