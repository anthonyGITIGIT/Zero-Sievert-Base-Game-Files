function array_move_down_value(arg0)
{
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (i < (array_length(arg0) - 1))
            arg0[i] = arg0[i + 1];
    }
    
    return arg0;
}
