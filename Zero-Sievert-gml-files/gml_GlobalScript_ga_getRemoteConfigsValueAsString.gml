function ga_getRemoteConfigsValueAsString()
{
    if (argument_count == 1)
        return getRemoteConfigsValueAsString_windows(argument[0]);
    else if (argument_count == 2)
        return getRemoteConfigsValueAsStringWithDefaultValue_windows(argument[0]);
    
    return "";
}
