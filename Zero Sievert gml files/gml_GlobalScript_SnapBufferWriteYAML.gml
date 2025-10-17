function SnapBufferWriteYAML(arg0, arg1, arg2 = false, arg3 = false)
{
    return __SnapToYAMLBufferValue(arg0, arg1, arg2, arg3, 0);
}

function __SnapToYAMLBufferValue(arg0, arg1, arg2, arg3, arg4)
{
    if (is_real(arg1) || is_int32(arg1) || is_int64(arg1))
    {
        buffer_write(arg0, buffer_text, SnapNumberToString(arg1, arg3));
    }
    else if (is_string(arg1))
    {
        var _length = string_length(arg1);
        var _hasColon = string_pos(":", arg1) > 0;
        arg1 = string_replace_all(arg1, "\\", "\\\\");
        arg1 = string_replace_all(arg1, "\"", "\\\"");
        arg1 = string_replace_all(arg1, "\n", "\\n");
        arg1 = string_replace_all(arg1, "\r", "\\r");
        arg1 = string_replace_all(arg1, "\t", "\\t");
        
        if (_length != string_length(arg1) || _hasColon)
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
        
        if (_count > 0)
        {
            var _i = 0;
            
            repeat (_count)
            {
                arg1 = _array[_i];
                
                if (_i > 0)
                {
                    repeat (arg4)
                        buffer_write(arg0, buffer_u16, 8224);
                }
                
                buffer_write(arg0, buffer_u16, 8237);
                arg4++;
                __SnapToYAMLBufferValue(arg0, arg1, arg2, arg3, arg4);
                arg4--;
                buffer_write(arg0, buffer_u8, 10);
                _i++;
            }
            
            buffer_seek(arg0, buffer_seek_relative, -1);
        }
        else
        {
            buffer_write(arg0, buffer_u16, 23899);
        }
    }
    else if (is_method(arg1))
    {
        buffer_write(arg0, buffer_text, string(arg1));
    }
    else if (is_struct(arg1))
    {
        var _struct = arg1;
        var _namesArray = variable_struct_get_names(_struct);
        
        if (arg2)
            array_sort(_namesArray, true);
        
        var _count = array_length(_namesArray);
        
        if (_count > 0)
        {
            var _i = 0;
            
            repeat (_count)
            {
                var _name = _namesArray[_i];
                arg1 = variable_struct_get(_struct, _name);
                
                if (is_struct(_name) || is_array(_name))
                {
                    show_error("SNAP:\nKey type \"" + typeof(_name) + "\" not supported\n ", false);
                    _name = string(ptr(_name));
                }
                
                if (_i > 0)
                {
                    repeat (arg4)
                        buffer_write(arg0, buffer_u16, 8224);
                }
                
                buffer_write(arg0, buffer_text, string(_name));
                buffer_write(arg0, buffer_u16, 8250);
                
                if (is_struct(arg1))
                {
                    if (variable_struct_names_count(arg1) > 0)
                    {
                        buffer_write(arg0, buffer_u8, 10);
                        
                        repeat (arg4 + 1)
                            buffer_write(arg0, buffer_u16, 8224);
                    }
                    
                    arg4++;
                    __SnapToYAMLBufferValue(arg0, arg1, arg2, arg3, arg4);
                    arg4--;
                }
                else if (is_array(arg1))
                {
                    if (array_length(arg1) > 0)
                    {
                        buffer_write(arg0, buffer_u8, 10);
                        
                        repeat (arg4)
                            buffer_write(arg0, buffer_u16, 8224);
                    }
                    
                    __SnapToYAMLBufferValue(arg0, arg1, arg2, arg3, arg4);
                }
                else
                {
                    arg4++;
                    __SnapToYAMLBufferValue(arg0, arg1, arg2, arg3, arg4);
                    arg4--;
                }
                
                buffer_write(arg0, buffer_u8, 10);
                _i++;
            }
            
            buffer_seek(arg0, buffer_seek_relative, -1);
        }
        else
        {
            buffer_write(arg0, buffer_u16, 32123);
        }
    }
    else if (is_undefined(arg1))
    {
    }
    else if (is_bool(arg1))
    {
        buffer_write(arg0, buffer_text, arg1 ? "true" : "false");
    }
    else if (is_ptr(arg1))
    {
        buffer_write(arg0, buffer_u8, 34);
        buffer_write(arg0, buffer_text, string(arg1));
        buffer_write(arg0, buffer_u8, 34);
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
