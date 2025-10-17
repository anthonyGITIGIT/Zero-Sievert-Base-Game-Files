function scr_convert_into_array()
{
    var o = argument[0];
    var arr;
    
    for (var i = 1; i < argument_count; i += 1)
        arr[o][i - 1] = argument[i];
    
    return arr;
}
