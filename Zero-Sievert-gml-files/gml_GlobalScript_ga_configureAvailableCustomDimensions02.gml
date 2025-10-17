function ga_configureAvailableCustomDimensions02(arg0)
{
    if (is_array(arg0))
        configureAvailableCustomDimensions02_windows(util_ga_arrayToJsonString(arg0));
    else
        ga_trace("ga_configureAvailableCustomDimensions02() argument is not an array");
}
