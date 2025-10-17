function ga_configureAvailableResourceCurrencies(arg0)
{
    if (is_array(arg0))
        configureAvailableResourceCurrencies_windows(util_ga_arrayToJsonString(arg0));
    else
        ga_trace("ga_configureAvailableResourceCurrencies() argument is not an array");
}
