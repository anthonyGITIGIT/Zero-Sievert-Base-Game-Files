function SnapBufferReadBinary(arg0, arg1)
{
    var _oldOffset = buffer_tell(arg0);
    buffer_seek(arg0, buffer_seek_start, arg1);
    var _value = __SnapFromBinaryValue(arg0);
    buffer_seek(arg0, buffer_seek_start, _oldOffset);
    return _value;
}

function __SnapFromBinaryValue(arg0)
{
    var _datatype = buffer_read(arg0, buffer_u8);
    
    switch (_datatype)
    {
        case 1:
            var _count = buffer_read(arg0, buffer_u64);
            var _struct = {};
            
            repeat (_count)
            {
                var _name = buffer_read(arg0, buffer_string);
                variable_struct_set(_struct, _name, __SnapFromBinaryValue(arg0));
            }
            
            return _struct;
            break;
        
        case 2:
            var _count = buffer_read(arg0, buffer_u64);
            var _array = array_create(_count, undefined);
            var _i = 0;
            
            repeat (_count)
            {
                _array[_i] = __SnapFromBinaryValue(arg0);
                _i++;
            }
            
            return _array;
            break;
        
        case 3:
            return buffer_read(arg0, buffer_string);
            break;
        
        case 4:
            return buffer_read(arg0, buffer_f64);
            break;
        
        case 5:
            return false;
            break;
        
        case 6:
            return true;
            break;
        
        case 7:
            return undefined;
            break;
        
        case 8:
            return buffer_read(arg0, buffer_s32);
            break;
        
        case 9:
            return int64(buffer_read(arg0, buffer_u64));
            break;
        
        case 10:
            return ptr(buffer_read(arg0, buffer_u64));
            break;
        
        case 11:
            return real(buffer_read(arg0, buffer_u64));
            break;
        
        default:
            show_error("SNAP:\nUnsupported datatype " + string(buffer_peek(arg0, 1, buffer_tell(arg0) - buffer_u8)) + " (position = " + string(buffer_tell(arg0) - 1) + ")\n ", false);
            break;
    }
}
