function uiAddNativeFunction(arg0, arg1 = script_get_name(arg0))
{
    __uiGlobal().__catspeakEnv.addGlobalFunction(arg1, arg0);
}
