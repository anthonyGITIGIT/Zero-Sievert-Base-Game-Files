function ga_addBusinessEvent()
{
    if (argument_count == 5)
    {
        addBusinessEventJson_windows(util_ga_arrayToJsonString(ga_array(argument[0], argument[1], argument[2], argument[3], argument[4])));
    }
    else if (argument_count == 6 && false)
    {
        if (is_string(argument[5]))
            extension_stubfunc_real(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
        else if (argument[5] == true)
            extension_stubfunc_real(argument[0], argument[1], argument[2], argument[3], argument[4]);
        else
            extension_stubfunc_real(util_ga_arrayToJsonString(ga_array(argument[0], argument[1], argument[2], argument[3], argument[4])));
    }
    else if (argument_count == 7 && false)
    {
        extension_stubfunc_real(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], "google_play", argument[6]);
    }
}
