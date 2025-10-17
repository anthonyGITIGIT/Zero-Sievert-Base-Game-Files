function SnapBufferWriteVDF(arg0, arg1, arg2 = false, arg3 = false)
{
    if (!is_struct(arg1))
        show_error("SNAP:\nTop-level data structure must be a struct\n ", true);
    
    var _names = variable_struct_get_names(arg1);
    
    if (arg2)
        array_sort(_names, true);
    
    var _count = array_length(_names);
    
    if (_count > 0)
    {
        var _i = 0;
        
        repeat (_count)
        {
            var _name = _names[_i];
            
            if (!is_string(_name))
                show_error("SNAP:\nKeys must be strings\n ", true);
            
            buffer_write(arg0, buffer_u8, 34);
            buffer_write(arg0, buffer_text, string(_name));
            buffer_write(arg0, buffer_u8, 34);
            __SnapToVDFBufferValue(arg0, variable_struct_get(arg1, _name), arg2, arg3, "");
            
            if (_i < (_count - 1))
                buffer_write(arg0, buffer_u8, 10);
            
            _i++;
        }
    }
    
    return arg0;
}

function __SnapToVDFBufferValue(arg0, arg1, arg2, arg3, arg4)
{
    if (is_array(arg1))
    {
        show_error("SNAP:\nArrays are not supported by the VDF format\n ", true);
    }
    else if (is_method(arg1))
    {
        buffer_write(arg0, buffer_u16, 8736);
        buffer_write(arg0, buffer_text, string(arg1));
        buffer_write(arg0, buffer_u8, 34);
    }
    else if (is_struct(arg1))
    {
        var _struct = arg1;
        var _names = variable_struct_get_names(_struct);
        
        if (arg2)
            array_sort(_names, true);
        
        buffer_write(arg0, buffer_u8, 10);
        buffer_write(arg0, buffer_text, arg4);
        buffer_write(arg0, buffer_u16, 2683);
        var _count = array_length(_names);
        
        if (_count > 0)
        {
            var _preIndent = arg4;
            arg4 += "\t";
            var _i = 0;
            
            repeat (_count)
            {
                var _name = _names[_i];
                
                if (!is_string(_name))
                    show_error("SNAP:\nKeys must be strings\n ", true);
                
                buffer_write(arg0, buffer_text, arg4);
                buffer_write(arg0, buffer_u8, 34);
                buffer_write(arg0, buffer_text, string(_name));
                buffer_write(arg0, buffer_u8, 34);
                __SnapToVDFBufferValue(arg0, variable_struct_get(_struct, _name), arg2, arg3, arg4);
                buffer_write(arg0, buffer_u8, 10);
                _i++;
            }
            
            arg4 = _preIndent;
        }
        
        buffer_write(arg0, buffer_text, arg4);
        buffer_write(arg0, buffer_u8, 125);
    }
    else if (is_real(arg1) || is_int32(arg1) || is_int64(arg1))
    {
        buffer_write(arg0, buffer_u16, 8736);
        buffer_write(arg0, buffer_text, SnapNumberToString(arg1, arg3));
        buffer_write(arg0, buffer_u8, 34);
    }
    else
    {
        arg1 = string(arg1);
        arg1 = string_replace_all(arg1, "\\", "\\\\");
        arg1 = string_replace_all(arg1, "\n", "\\n");
        arg1 = string_replace_all(arg1, "\r", "\\r");
        arg1 = string_replace_all(arg1, "\t", "\\t");
        arg1 = string_replace_all(arg1, "\"", "\\\"");
        buffer_write(arg0, buffer_u16, 8736);
        buffer_write(arg0, buffer_text, arg1);
        buffer_write(arg0, buffer_u8, 34);
    }
    
    return arg0;
}
