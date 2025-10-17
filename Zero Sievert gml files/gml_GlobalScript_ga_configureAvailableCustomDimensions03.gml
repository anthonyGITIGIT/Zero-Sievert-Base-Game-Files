function ga_configureAvailableCustomDimensions03(arg0)
{
    if (is_array(arg0))
        configureAvailableCustomDimensions03_windows(util_ga_arrayToJsonString(arg0));
    else
        ga_trace("ga_configureAvailableCustomDimensions03() argument is not an array");
}
