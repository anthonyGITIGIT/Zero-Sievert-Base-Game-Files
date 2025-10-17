function SnapBufferWriteCSV(arg0, arg1, arg2 = ",", arg3 = "\"", arg4 = false)
{
    var _cellDelimiterOrd = ord(arg2);
    var _stringDelimiterDouble = arg3 + arg3;
    var _stringDelimiterOrd = ord(arg3);
    var _y = 0;
    
    repeat (array_length(arg1))
    {
        var _row_array = arg1[_y];
        var _x = 0;
        
        repeat (array_length(_row_array))
        {
            var _value = _row_array[_x];
            
            if (is_real(_value))
            {
                buffer_write(arg0, buffer_text, SnapNumberToString(_value, arg4));
            }
            else if (is_string(_value))
            {
                var _old_size = string_byte_length(_value);
                _value = string_replace_all(_value, arg3, _stringDelimiterDouble);
                
                if (_old_size != string_byte_length(_value) || string_pos(arg2, _value) > 0)
                {
                    buffer_write(arg0, buffer_u8, _stringDelimiterOrd);
                    buffer_write(arg0, buffer_text, _value);
                    buffer_write(arg0, buffer_u8, _stringDelimiterOrd);
                }
                else
                {
                    buffer_write(arg0, buffer_text, _value);
                }
            }
            else if (is_method(_value))
            {
                buffer_write(arg0, buffer_text, string(_value));
            }
            else if (is_struct(_value) || is_array(_value))
            {
                show_error("SNAP:\nArray contains a nested struct or array. This is incompatible with CSV\n ", true);
            }
            else if (is_numeric(_value) && typeof(_value) == "ref")
            {
                buffer_write(arg0, buffer_text, string(real(_value)));
            }
            else
            {
                buffer_write(arg0, buffer_text, string(_value));
            }
            
            buffer_write(arg0, buffer_u8, _cellDelimiterOrd);
            _x++;
        }
        
        buffer_write(arg0, buffer_u8, 13);
        _y++;
    }
    
    return arg0;
}
