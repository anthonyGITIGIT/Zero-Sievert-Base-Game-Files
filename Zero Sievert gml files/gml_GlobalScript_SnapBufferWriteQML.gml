function SnapBufferWriteQML(arg0, arg1, arg2, arg3 = false, arg4 = false)
{
    var _invertedInstanceofDict = {};
    var _namesArray = variable_struct_get_names(arg2);
    var _i = 0;
    
    repeat (array_length(_namesArray))
    {
        var _name = _namesArray[_i];
        variable_struct_set(_invertedInstanceofDict, script_get_name(variable_struct_get(arg2, _name)), _name);
        _i++;
    }
    
    return __SnapToQMLBufferValue(arg0, arg1, _invertedInstanceofDict, arg3, arg4, "");
}

function __SnapToQMLBufferValue(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var _childrenArrayVariableName = "children";
    
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
        
        if (arg1 == "true" || arg1 == "false" || arg1 == "null" || string_pos(":", arg1) > 0 || string_pos(";", arg1) > 0 || string_pos("{", arg1) > 0 || string_pos("}", arg1) > 0 || string_pos("[", arg1) > 0 || string_pos("]", arg1) > 0 || ord(string_char_at(arg1, 1)) <= 32 || ord(string_char_at(arg1, string_length(arg1))) <= 32)
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
        else
        {
            buffer_write(arg0, buffer_u16, 2651);
            var _preIndent = arg5;
            arg5 += "\t";
            var _i = 0;
            
            repeat (_count)
            {
                buffer_write(arg0, buffer_text, arg5);
                __SnapToQMLBufferValue(arg0, _array[_i], arg2, arg3, arg4, arg5);
                buffer_write(arg0, buffer_u8, 10);
                _i++;
            }
            
            arg5 = _preIndent;
            buffer_seek(arg0, buffer_seek_relative, -1);
            buffer_write(arg0, buffer_u8, 10);
            buffer_write(arg0, buffer_text, arg5);
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
        var _instanceof = instanceof(_struct);
        var _name = variable_struct_get(arg2, _instanceof);
        
        if (arg3 && _name == undefined)
            _name = _instanceof;
        
        if (!is_string(_name))
            show_error("SNAP:\nFound struct with unrecognised instanceof \"" + string(_instanceof) + "\"\n ", true);
        
        buffer_write(arg0, buffer_text, _name);
        buffer_write(arg0, buffer_u8, 32);
        var _names = variable_struct_get_names(_struct);
        array_sort(_names, true);
        var _count = array_length(_names);
        
        if (_count <= 0)
        {
            buffer_write(arg0, buffer_u16, 32123);
        }
        else
        {
            buffer_write(arg0, buffer_u16, 2683);
            var _preIndent = arg5;
            arg5 += "\t";
            var _hasAttributes = false;
            var _i = 0;
            
            repeat (_count)
            {
                _name = _names[_i];
                
                if (!is_string(_name))
                    show_error("SNAP:\nKeys must be strings\n ", true);
                
                if (!(_name == _childrenArrayVariableName && is_array(variable_struct_get(_struct, _name))))
                {
                    _hasAttributes = true;
                    buffer_write(arg0, buffer_text, arg5);
                    __SnapToQMLBufferValue(arg0, _name, arg2, arg3, arg4, arg5);
                    buffer_write(arg0, buffer_u16, 8250);
                    __SnapToQMLBufferValue(arg0, variable_struct_get(_struct, _name), arg2, arg3, arg4, arg5);
                    buffer_write(arg0, buffer_u8, 10);
                }
                
                _i++;
            }
            
            var _childrenArray = variable_struct_get(_struct, _childrenArrayVariableName);
            
            if (is_array(_childrenArray))
            {
                _i = 0;
                
                repeat (array_length(_childrenArray))
                {
                    if (_i > 0 || _hasAttributes)
                    {
                        buffer_write(arg0, buffer_text, arg5);
                        buffer_write(arg0, buffer_u8, 10);
                    }
                    
                    buffer_write(arg0, buffer_text, arg5);
                    __SnapToQMLBufferValue(arg0, _childrenArray[_i], arg2, arg3, arg4, arg5);
                    buffer_write(arg0, buffer_u8, 10);
                    _i++;
                }
            }
            
            arg5 = _preIndent;
            buffer_write(arg0, buffer_text, arg5);
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
