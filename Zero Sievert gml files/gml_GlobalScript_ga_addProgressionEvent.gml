function ga_addProgressionEvent()
{
    var status = argument[0];
    
    if (argument_count == 2)
    {
        addProgressionEvent_windows(status, argument[1], "", "");
    }
    else if (argument_count == 3)
    {
        if (is_real(argument[2]))
            addProgressionEventWithScoreJson_windows(util_ga_arrayToJsonString(ga_array(status, argument[1], "", "", argument[2])));
        else
            addProgressionEvent_windows(status, argument[1], argument[2], "");
    }
    else if (argument_count == 4)
    {
        if (is_real(argument[3]))
            addProgressionEventWithScoreJson_windows(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], "", argument[3])));
        else
            addProgressionEvent_windows(status, argument[1], argument[2], argument[3]);
    }
    else if (argument_count == 5)
    {
        addProgressionEventWithScoreJson_windows(util_ga_arrayToJsonString(ga_array(status, argument[1], argument[2], argument[3], argument[4])));
    }
}
