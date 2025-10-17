function ga_configureAvailableCustomDimensions01(arg0)
{
    if (is_array(arg0))
        configureAvailableCustomDimensions01_windows(util_ga_arrayToJsonString(arg0));
    else
        ga_trace("ga_configureAvailableCustomDimensions01() argument is not an array");
}
