function ga_addDesignEvent()
{
    if (argument_count == 1)
        addDesignEvent_windows(argument[0]);
    else if (argument_count == 2)
        addDesignEventWithValue_windows(argument[0], argument[1]);
}
