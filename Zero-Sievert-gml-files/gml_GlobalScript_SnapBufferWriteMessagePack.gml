function SnapBufferWriteMessagePack(arg0, arg1)
{
    if (is_method(arg1))
    {
        __SnapToMessagepackString(arg0, string(arg1));
    }
    else if (is_struct(arg1))
    {
        var _struct = arg1;
        var _messagepackDatatype = struct_get_from_hash(arg1, variable_get_hash("messagepackDatatype"));
        
        if (_messagepackDatatype == "bin")
        {
            var _array = _struct.data;
            var _count = array_length(_array);
            
            if (_count <= 255)
            {
                buffer_write(arg0, buffer_u8, 196);
                buffer_write(arg0, buffer_u8, _count);
            }
            else if (_count <= 65535)
            {
                buffer_write(arg0, buffer_u8, 197);
                __SnapToMessagepackLittleEndian(arg0, 3, _count);
            }
            else if (_count <= 4294967295)
            {
                buffer_write(arg0, buffer_u8, 198);
                __SnapToMessagepackLittleEndian(arg0, 5, _count);
            }
            else
            {
                show_error("SNAP:\nTrying to write a binary array longer than 4294967295 elements\n(How did you make an array this big?!)\n ", true);
            }
            
            var _i = 0;
            
            repeat (_count)
            {
                buffer_write(arg0, buffer_u8, _array[_i]);
                _i++;
            }
        }
        else if (_messagepackDatatype == "ext")
        {
            var _array = _struct.data;
            var _count = array_length(_array);
            
            if (_count == 1)
            {
                buffer_write(arg0, buffer_u8, 212);
            }
            else if (_count == 2)
            {
                buffer_write(arg0, buffer_u8, 213);
            }
            else if (_count == 4)
            {
                buffer_write(arg0, buffer_u8, 214);
            }
            else if (_count == 8)
            {
                buffer_write(arg0, buffer_u8, 215);
            }
            else if (_count == 16)
            {
                buffer_write(arg0, buffer_u8, 216);
            }
            else if (_count <= 255)
            {
                buffer_write(arg0, buffer_u8, 199);
                buffer_write(arg0, buffer_u8, _count);
            }
            else if (_count <= 65535)
            {
                buffer_write(arg0, buffer_u8, 200);
                __SnapToMessagepackLittleEndian(arg0, 3, _count);
            }
            else if (_count <= 4294967295)
            {
                buffer_write(arg0, buffer_u8, 201);
                __SnapToMessagepackLittleEndian(arg0, 5, _count);
            }
            else
            {
                show_error("SNAP:\nTrying to write an extended binary array longer than 4294967295 elements\n(How did you make an array this big?!)\n ", true);
            }
            
            buffer_write(arg0, buffer_s8, _struct.type);
            var _i = 0;
            
            repeat (_count)
            {
                buffer_write(arg0, buffer_u8, _array[_i]);
                _i++;
            }
        }
        else
        {
            var _names = variable_struct_get_names(_struct);
            var _count = array_length(_names);
            
            if (_count <= 15)
            {
                buffer_write(arg0, buffer_u8, 128 | _count);
            }
            else if (_count <= 65535)
            {
                buffer_write(arg0, buffer_u8, 222);
                __SnapToMessagepackLittleEndian(arg0, 3, _count);
            }
            else if (_count <= 4294967295)
            {
                buffer_write(arg0, buffer_u8, 223);
                __SnapToMessagepackLittleEndian(arg0, 5, _count);
            }
            else
            {
                show_error("SNAP:\nTrying to write a struct longer than 4294967295 elements\n(How did you make a struct this big?!)\n ", true);
            }
            
            var _i = 0;
            
            repeat (_count)
            {
                var _name = _names[_i];
                SnapBufferWriteMessagePack(arg0, _name);
                SnapBufferWriteMessagePack(arg0, variable_struct_get(_struct, _name));
                _i++;
            }
        }
    }
    else if (is_array(arg1))
    {
        var _array = arg1;
        var _count = array_length(_array);
        
        if (_count <= 15)
        {
            buffer_write(arg0, buffer_u8, 144 | _count);
        }
        else if (_count <= 65535)
        {
            buffer_write(arg0, buffer_u8, 220);
            __SnapToMessagepackLittleEndian(arg0, 3, _count);
        }
        else if (_count <= 4294967295)
        {
            buffer_write(arg0, buffer_u8, 221);
            __SnapToMessagepackLittleEndian(arg0, 5, _count);
        }
        else
        {
            show_error("SNAP:\nTrying to write an array longer than 4294967295 elements\n(How did you make an array this big?!)\n ", true);
        }
        
        var _i = 0;
        
        repeat (_count)
        {
            SnapBufferWriteMessagePack(arg0, _array[_i]);
            _i++;
        }
    }
    else if (is_string(arg1))
    {
        __SnapToMessagepackString(arg0, arg1);
    }
    else if (is_bool(arg1))
    {
        buffer_write(arg0, buffer_u8, arg1 ? 195 : 194);
    }
    else if (is_numeric(arg1))
    {
        if (is_int32(arg1) || is_int64(arg1) || floor(arg1) == arg1)
        {
            if (arg1 > 0)
            {
                if (arg1 <= 127)
                {
                    buffer_write(arg0, buffer_u8, arg1);
                }
                else if (arg1 <= 255)
                {
                    buffer_write(arg0, buffer_u8, 204);
                    buffer_write(arg0, buffer_u8, arg1);
                }
                else if (arg1 <= 65535)
                {
                    buffer_write(arg0, buffer_u8, 205);
                    __SnapToMessagepackLittleEndian(arg0, 3, arg1);
                }
                else if (arg1 <= 4294967295)
                {
                    buffer_write(arg0, buffer_u8, 206);
                    __SnapToMessagepackLittleEndian(arg0, 5, arg1);
                }
                else
                {
                    buffer_write(arg0, buffer_u8, 207);
                    __SnapToMessagepackLittleEndian(arg0, 12, arg1);
                }
            }
            else if (arg1 == 0)
            {
                buffer_write(arg0, buffer_u8, 0);
            }
            else if (-arg1 <= 31)
            {
                buffer_write(arg0, buffer_u8, 224 | (32 + arg1));
            }
            else if (-arg1 <= 255)
            {
                buffer_write(arg0, buffer_u8, 208);
                buffer_write(arg0, buffer_s8, arg1);
            }
            else if (-arg1 <= 65535)
            {
                buffer_write(arg0, buffer_u8, 209);
                __SnapToMessagepackLittleEndian(arg0, 4, arg1);
            }
            else if (-arg1 <= 4294967295)
            {
                buffer_write(arg0, buffer_u8, 210);
                __SnapToMessagepackLittleEndian(arg0, 6, arg1);
            }
            else
            {
                buffer_write(arg0, buffer_u8, 211);
                __SnapToMessagepackLittleEndian(arg0, 12, arg1);
            }
        }
        else if (is_real(arg1))
        {
            buffer_write(arg0, buffer_u8, 203);
            __SnapToMessagepackLittleEndian(arg0, 9, arg1);
        }
        else
        {
            buffer_write(arg0, buffer_u8, 207);
            __SnapToMessagepackLittleEndian(arg0, 12, int64(arg1));
        }
    }
    else if (is_undefined(arg1))
    {
        buffer_write(arg0, buffer_u8, 192);
    }
    else
    {
        show_error("SNAP:\nUnsupported datatype \"" + typeof(arg1) + "\"\n ", false);
        buffer_write(arg0, buffer_u8, 192);
    }
    
    return arg0;
}

function __SnapToMessagepackLittleEndian(arg0, arg1, arg2)
{
    static _flipBuffer = buffer_create(8, buffer_fixed, 1);
    
    switch (buffer_sizeof(arg1))
    {
        case 1:
            buffer_write(arg0, arg1, arg2);
            break;
        
        case 2:
            buffer_poke(_flipBuffer, 0, arg1, arg2);
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 1, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 0, buffer_u8));
            break;
        
        case 4:
            buffer_poke(_flipBuffer, 0, arg1, arg2);
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 3, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 2, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 1, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 0, buffer_u8));
            break;
        
        case 8:
            buffer_poke(_flipBuffer, 0, arg1, arg2);
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 7, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 6, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 5, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 4, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 3, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 2, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 1, buffer_u8));
            buffer_write(arg0, buffer_u8, buffer_peek(_flipBuffer, 0, buffer_u8));
            break;
    }
}

function __SnapToMessagepackString(arg0, arg1)
{
    var _size = string_byte_length(arg1);
    
    if (_size <= 31)
    {
        buffer_write(arg0, buffer_u8, 160 | _size);
    }
    else if (_size <= 255)
    {
        buffer_write(arg0, buffer_u8, 217);
        buffer_write(arg0, buffer_u8, _size);
    }
    else if (_size <= 65535)
    {
        buffer_write(arg0, buffer_u8, 218);
        __SnapToMessagepackLittleEndian(arg0, 3, _size);
    }
    else if (_size <= 4294967295)
    {
        buffer_write(arg0, buffer_u8, 219);
        __SnapToMessagepackLittleEndian(arg0, 5, _size);
    }
    else
    {
        show_error("SNAP:\nTrying to write a string longer than 4294967295 bytes\n(How did you make a string this big?!)\n ", true);
    }
    
    buffer_write(arg0, buffer_text, arg1);
}
