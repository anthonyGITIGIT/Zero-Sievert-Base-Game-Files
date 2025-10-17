function trace()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    show_debug_message(_string);
    
    if (!variable_global_exists("trace_to_file"))
        scan_for_log_to_file();
    
    if (global.trace_to_file)
    {
        if (!variable_global_exists("__trace_buffer"))
        {
            global.__trace_buffer = buffer_create(1024, buffer_grow, 1);
            var _datetime = date_current_datetime();
            global.__filename = concat(date_get_year(_datetime), "-", date_get_month(_datetime), "-", date_get_day(_datetime), "_", date_get_hour(_datetime), "-", date_get_minute(_datetime), "-", date_get_second(_datetime), ".log");
        }
        
        buffer_write(global.__trace_buffer, buffer_text, _string);
        buffer_write(global.__trace_buffer, buffer_u8, 10);
        buffer_save(global.__trace_buffer, global.__filename);
    }
}
