function ga_configureAvailableResourceItemTypes(arg0)
{
    if (is_array(arg0))
        configureAvailableResourceItemTypes_windows(util_ga_arrayToJsonString(arg0));
    else
        ga_trace("ga_configureAvailableResourceItemTypes() argument is not an array");
}
