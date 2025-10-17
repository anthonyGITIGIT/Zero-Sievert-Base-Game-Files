function SnapBufferWriteGML(arg0, arg1, arg2 = false)
{
    __SnapBufferWriteGMLInner(arg0, arg1, arg2, 0, "");
}

function __SnapBufferWriteGMLInner(arg0, arg1, arg2, arg3, arg4)
{
    if (is_method(arg1))
    {
        buffer_write(arg0, buffer_text, "\"");
        buffer_write(arg0, buffer_text, string(arg1));
        buffer_write(arg0, buffer_text, "\"");
    }
    else if (is_struct(arg1))
    {
        var _struct = arg1;
        var _names = variable_struct_get_names(_struct);
        var _count = array_length(_names);
        var _i = 0;
        
        if (arg2)
            array_sort(_names, true);
        
        if (_count > 0)
        {
            var _preIndent;
            
            if (arg3 != 0)
            {
                buffer_write(arg0, buffer_text, "{\n");
                _preIndent = arg4;
                arg4 += "    ";
            }
            
            _i = 0;
            
            repeat (_count)
            {
                var _name = _names[_i];
                
                if (is_struct(_name) || is_array(_name))
                {
                    show_error("SNAP:\nKey type \"" + typeof(_name) + "\" not supported\n ", false);
                    _name = string(ptr(_name));
                }
                
                if (arg3 == 0)
                {
                    buffer_write(arg0, buffer_text, arg4);
                    buffer_write(arg0, buffer_text, string(_name));
                    buffer_write(arg0, buffer_text, " = ");
                    __SnapBufferWriteGMLInner(arg0, variable_struct_get(_struct, _name), arg2, arg3 + 1, arg4);
                    buffer_write(arg0, buffer_text, ";\n");
                }
                else
                {
                    buffer_write(arg0, buffer_text, arg4);
                    buffer_write(arg0, buffer_text, string(_name));
                    buffer_write(arg0, buffer_text, ": ");
                    __SnapBufferWriteGMLInner(arg0, variable_struct_get(_struct, _name), arg2, arg3 + 1, arg4);
                    buffer_write(arg0, buffer_text, ",\n");
                }
                
                _i++;
            }
            
            if (arg3 != 0)
            {
                arg4 = _preIndent;
                buffer_write(arg0, buffer_text, arg4);
                buffer_write(arg0, buffer_text, "}");
            }
        }
        else
        {
            buffer_write(arg0, buffer_text, "{}");
        }
    }
    else if (is_array(arg1))
    {
        var _array = arg1;
        var _count = array_length(_array);
        
        if (_count > 0)
        {
            var _preIndent = arg4;
            arg4 += "    ";
            buffer_write(arg0, buffer_text, "[\n");
            var _i = 0;
            
            repeat (_count)
            {
                buffer_write(arg0, buffer_text, arg4);
                __SnapBufferWriteGMLInner(arg0, _array[_i], arg2, arg3 + 1, arg4);
                buffer_write(arg0, buffer_text, ",\n");
                _i++;
            }
            
            arg4 = _preIndent;
            buffer_write(arg0, buffer_text, arg4);
            buffer_write(arg0, buffer_text, "]");
        }
        else
        {
            buffer_write(arg0, buffer_text, "[]");
        }
    }
    else if (is_string(arg1))
    {
        arg1 = string_replace_all(arg1, "\\", "\\\\");
        arg1 = string_replace_all(arg1, "\n", "\\n");
        arg1 = string_replace_all(arg1, "\r", "\\r");
        arg1 = string_replace_all(arg1, "\t", "\\t");
        arg1 = string_replace_all(arg1, "\"", "\\\"");
        buffer_write(arg0, buffer_text, "\"");
        buffer_write(arg0, buffer_text, arg1);
        buffer_write(arg0, buffer_text, "\"");
    }
    else if (is_undefined(arg1))
    {
        buffer_write(arg0, buffer_text, "undefined");
    }
    else if (is_bool(arg1))
    {
        buffer_write(arg0, buffer_text, arg1 ? "true" : "false");
    }
    else if (is_real(arg1))
    {
        buffer_write(arg0, buffer_text, SnapNumberToString(arg1, true));
    }
    else if (is_ptr(arg1))
    {
        buffer_write(arg0, buffer_text, "ptr(0x");
        buffer_write(arg0, buffer_text, string(arg1));
        buffer_write(arg0, buffer_text, ")");
    }
    else if (is_int32(arg1) || is_int64(arg1))
    {
        buffer_write(arg0, buffer_text, "0x");
        buffer_write(arg0, buffer_text, string(ptr(arg1)));
    }
    else if (is_numeric(arg1))
    {
        buffer_write(arg0, buffer_text, string(real(arg1)));
    }
    else
    {
        buffer_write(arg0, buffer_text, string(arg1));
    }
}
