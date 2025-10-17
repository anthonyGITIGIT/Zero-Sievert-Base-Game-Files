function SnapBufferWriteLooseJSON(arg0, arg1, arg2 = false, arg3 = false, arg4 = false)
{
    return __SnapToLooseJSONBufferValue(arg0, arg1, arg2, arg3, arg4, "");
}

function __SnapToLooseJSONBufferValue(arg0, arg1, arg2, arg3, arg4, arg5)
{
    if (is_real(arg1) || is_int32(arg1) || is_int64(arg1))
    {
        buffer_write(arg0, buffer_text, SnapNumberToString(arg1, arg4));
    }
    else if (is_string(arg1))
    {
        arg1 = string_replace_all(arg1, "\\", "\\\\");
        arg1 = string_replace_all(arg1, "\n", "\\n");
        arg1 = string_replace_all(arg1, "\r", "\\r");
        arg1 = string_replace_all(arg1, "\t", "\\t");
        arg1 = string_replace_all(arg1, "\"", "\\\"");
        
        if (arg1 == "true" || arg1 == "false" || arg1 == "null" || string_pos(":", arg1) > 0 || string_pos(",", arg1) > 0 || string_pos("{", arg1) > 0 || string_pos("}", arg1) > 0 || string_pos("[", arg1) > 0 || string_pos("]", arg1) > 0 || ord(string_char_at(arg1, 1)) <= 32 || ord(string_char_at(arg1, string_length(arg1))) <= 32)
        {
            buffer_write(arg0, buffer_u8, 34);
            buffer_write(arg0, buffer_text, arg1);
            buffer_write(arg0, buffer_u8, 34);
        }
        else
        {
            buffer_write(arg0, buffer_text, arg1);
        }
    }
    else if (is_array(arg1))
    {
        var _array = arg1;
        var _count = array_length(_array);
        
        if (_count <= 0)
        {
            buffer_write(arg0, buffer_u16, 23899);
        }
        else if (arg2)
        {
            buffer_write(arg0, buffer_u16, 2651);
            var _preIndent = arg5;
            arg5 += "\t";
            var _i = 0;
            
            repeat (_count)
            {
                buffer_write(arg0, buffer_text, arg5);
                __SnapToLooseJSONBufferValue(arg0, _array[_i], arg2, arg3, arg4, arg5);
                buffer_write(arg0, buffer_u16, 2604);
                _i++;
            }
            
            arg5 = _preIndent;
            buffer_seek(arg0, buffer_seek_relative, -2);
            buffer_write(arg0, buffer_u8, 10);
            buffer_write(arg0, buffer_text, arg5);
            buffer_write(arg0, buffer_u8, 93);
        }
        else
        {
            buffer_write(arg0, buffer_u8, 91);
            var _i = 0;
            
            repeat (_count)
            {
                __SnapToLooseJSONBufferValue(arg0, _array[_i], arg2, arg3, arg4, arg5);
                buffer_write(arg0, buffer_u8, 44);
                _i++;
            }
            
            if (_count > 0)
                buffer_seek(arg0, buffer_seek_relative, -1);
            
            buffer_write(arg0, buffer_u8, 93);
        }
    }
    else if (is_method(arg1))
    {
        buffer_write(arg0, buffer_text, string(arg1));
    }
    else if (is_struct(arg1))
    {
        var _struct = arg1;
        var _names = variable_struct_get_names(_struct);
        
        if (arg3)
            array_sort(_names, true);
        
        var _count = array_length(_names);
        
        if (_count <= 0)
        {
            buffer_write(arg0, buffer_u16, 32123);
        }
        else if (arg2)
        {
            buffer_write(arg0, buffer_u16, 2683);
            var _preIndent = arg5;
            arg5 += "\t";
            var _i = 0;
            
            repeat (_count)
            {
                var _name = _names[_i];
                
                if (!is_string(_name))
                    show_error("SNAP:\nKeys must be strings\n ", true);
                
                buffer_write(arg0, buffer_text, arg5);
                __SnapToLooseJSONBufferValue(arg0, _name, arg2, arg3, arg4, arg5);
                buffer_write(arg0, buffer_u16, 8250);
                __SnapToLooseJSONBufferValue(arg0, variable_struct_get(_struct, _name), arg2, arg3, arg4, arg5);
                buffer_write(arg0, buffer_u16, 2604);
                _i++;
            }
            
            arg5 = _preIndent;
            buffer_seek(arg0, buffer_seek_relative, -2);
            buffer_write(arg0, buffer_u8, 10);
            buffer_write(arg0, buffer_text, arg5);
            buffer_write(arg0, buffer_u8, 125);
        }
        else
        {
            buffer_write(arg0, buffer_u8, 123);
            var _i = 0;
            
            repeat (_count)
            {
                var _name = _names[_i];
                
                if (!is_string(_name))
                    show_error("SNAP:\nKeys must be strings\n ", true);
                
                __SnapToLooseJSONBufferValue(arg0, _name, arg2, arg3, arg4, arg5);
                buffer_write(arg0, buffer_u8, 58);
                __SnapToLooseJSONBufferValue(arg0, variable_struct_get(_struct, _name), arg2, arg3, arg4, arg5);
                buffer_write(arg0, buffer_u8, 44);
                _i++;
            }
            
            buffer_seek(arg0, buffer_seek_relative, -1);
            buffer_write(arg0, buffer_u8, 125);
        }
    }
    else if (is_undefined(arg1))
    {
        buffer_write(arg0, buffer_text, "null");
    }
    else if (is_bool(arg1))
    {
        buffer_write(arg0, buffer_text, arg1 ? "true" : "false");
    }
    else if (is_ptr(arg1))
    {
        buffer_write(arg0, buffer_text, string(arg1));
    }
    else if (is_numeric(arg1))
    {
        buffer_write(arg0, buffer_text, string(real(arg1)));
    }
    else
    {
        buffer_write(arg0, buffer_text, string(arg1));
    }
    
    return arg0;
}
