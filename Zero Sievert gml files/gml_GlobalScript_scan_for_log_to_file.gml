function scan_for_log_to_file()
{
    global.trace_to_file = false;
    var _i = 0;
    
    repeat (parameter_count())
    {
        if (parameter_string(_i) == "-log_to_file")
            global.trace_to_file = true;
        
        _i++;
    }
}
