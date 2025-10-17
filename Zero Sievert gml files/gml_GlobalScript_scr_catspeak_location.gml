function catspeak_location_create(arg0, arg1)
{
    var bitsRow = arg0 & 1048575;
    var bitsCol = (arg1 << 20) & 4293918720;
    return bitsRow | bitsCol;
}

function catspeak_location_get_row(arg0)
{
    return arg0 & 1048575;
}

function catspeak_location_get_column(arg0)
{
    return (arg0 & 4293918720) >> 20;
}

function __catspeak_location_show(arg0)
{
    var msg = "in a file";
    
    if (arg0 != undefined)
        msg += (" at (line " + __catspeak_string(catspeak_location_get_row(arg0)) + ", column " + __catspeak_string(catspeak_location_get_column(arg0)) + ")");
    
    return msg;
}

function __catspeak_location_show_ext(arg0)
{
    var msg = __catspeak_location_show(arg0);
    
    if (argument_count > 1)
    {
        msg += " -- ";
        
        for (var i = 1; i < argument_count; i += 1)
            msg += __catspeak_string(argument[i]);
    }
    
    return msg;
}
