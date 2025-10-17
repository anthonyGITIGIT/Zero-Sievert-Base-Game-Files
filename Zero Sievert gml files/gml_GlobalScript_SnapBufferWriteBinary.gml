function SnapBufferWriteBinary(arg0, arg1, arg2 = false)
{
    if (is_method(arg1))
    {
        buffer_write(arg0, buffer_u8, 3);
        buffer_write(arg0, buffer_string, string(arg1));
    }
    else if (is_struct(arg1))
    {
        var _struct = arg1;
        var _names = variable_struct_get_names(_struct);
        
        if (arg2 && is_array(_names))
            array_sort(_names, true);
        
        var _count = array_length(_names);
        buffer_write(arg0, buffer_u8, 1);
        buffer_write(arg0, buffer_u64, _count);
        var _i = 0;
        
        repeat (_count)
        {
            var _name = _names[_i];
            
            if (!is_string(_name))
                show_error("SNAP:\nKeys must be strings\n ", true);
            
            buffer_write(arg0, buffer_string, string(_name));
            SnapBufferWriteBinary(arg0, variable_struct_get(_struct, _name), arg2);
            _i++;
        }
    }
    else if (is_array(arg1))
    {
        var _array = arg1;
        var _count = array_length(_array);
        buffer_write(arg0, buffer_u8, 2);
        buffer_write(arg0, buffer_u64, _count);
        var _i = 0;
        
        repeat (_count)
        {
            SnapBufferWriteBinary(arg0, _array[_i], arg2);
            _i++;
        }
    }
    else if (is_string(arg1))
    {
        buffer_write(arg0, buffer_u8, 3);
        buffer_write(arg0, buffer_string, arg1);
    }
    else if (is_real(arg1))
    {
        if (arg1 == 0)
        {
            buffer_write(arg0, buffer_u8, 5);
        }
        else if (arg1 == 1)
        {
            buffer_write(arg0, buffer_u8, 6);
        }
        else
        {
            buffer_write(arg0, buffer_u8, 4);
            buffer_write(arg0, buffer_f64, arg1);
        }
    }
    else if (is_bool(arg1))
    {
        buffer_write(arg0, buffer_u8, arg1 ? 6 : 5);
    }
    else if (is_undefined(arg1))
    {
        buffer_write(arg0, buffer_u8, 7);
    }
    else if (is_int32(arg1))
    {
        buffer_write(arg0, buffer_u8, 8);
        buffer_write(arg0, buffer_s32, arg1);
    }
    else if (is_int64(arg1))
    {
        buffer_write(arg0, buffer_u8, 9);
        buffer_write(arg0, buffer_u64, arg1);
    }
    else if (is_ptr(arg1))
    {
        buffer_write(arg0, buffer_u8, 10);
        buffer_write(arg0, buffer_u64, int64(arg1));
    }
    else if (typeof(arg1) == "ref")
    {
        buffer_write(arg0, buffer_u8, 11);
        buffer_write(arg0, buffer_u64, int64(real(arg1)));
    }
    else
    {
        show_message("Datatype \"" + typeof(arg1) + "\" not supported");
    }
    
    return arg0;
}
