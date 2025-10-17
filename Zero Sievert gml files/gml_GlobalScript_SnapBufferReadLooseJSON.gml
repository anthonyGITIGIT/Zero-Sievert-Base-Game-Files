function SnapBufferReadLooseJSON(arg0, arg1 = undefined)
{
    var _oldOffset;
    
    if (arg1 != undefined)
    {
        _oldOffset = buffer_tell(arg0);
        buffer_seek(arg0, buffer_seek_start, arg1);
    }
    
    var _bufferSize = buffer_get_size(arg0);
    var _result = undefined;
    
    while (buffer_tell(arg0) < _bufferSize)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 47)
            __SnapBufferReadLooseJSONComment(arg0, _bufferSize);
        else if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
            __SnapBufferReadLooseJSONMultilineComment(arg0, _bufferSize);
        else if (_byte == 91)
            _result = __SnapBufferReadLooseJSONArray(arg0, _bufferSize);
        else if (_byte == 123)
            _result = __SnapBufferReadLooseJSONStruct(arg0, _bufferSize);
        else if (_byte > 32)
            show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting either { or [\n ", true);
    }
    
    if (arg1 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
    
    return _result;
}

function __SnapBufferReadLooseJSONArray(arg0, arg1)
{
    var _result = [];
    
    while (buffer_tell(arg0) < arg1)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 47)
        {
            __SnapBufferReadLooseJSONComment(arg0, arg1);
        }
        else if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
        {
            __SnapBufferReadLooseJSONMultilineComment(arg0, arg1);
        }
        else if (_byte == 93)
        {
            return _result;
        }
        else if (_byte == 58 || _byte == 44)
        {
            show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a value\n ", true);
        }
        else if (_byte > 32)
        {
            var _value = __SnapBufferReadLooseJSONValue(arg0, arg1, _byte);
            array_push(_result, _value);
            
            while (buffer_tell(arg0) < arg1)
            {
                _byte = buffer_read(arg0, buffer_u8);
                
                if (_byte == 93)
                    return _result;
                else if (_byte == 44 || _byte == 10 || _byte == 13)
                    break;
                else if (_byte > 32)
                    show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting comma, newline, or closing bracket\n ", true);
            }
        }
    }
    
    show_error("SNAP:\nFound unterminated array\n ", true);
}

function __SnapBufferReadLooseJSONStruct(arg0, arg1)
{
    var _result = {};
    
    while (buffer_tell(arg0) < arg1)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 47)
        {
            __SnapBufferReadLooseJSONComment(arg0, arg1);
        }
        else if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
        {
            __SnapBufferReadLooseJSONMultilineComment(arg0, arg1);
        }
        else if (_byte == 125)
        {
            return _result;
        }
        else if (_byte == 58 || _byte == 44)
        {
            show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a key\n ", true);
        }
        else if (_byte > 32)
        {
            var _key = __SnapBufferReadLooseJSONValue(arg0, arg1, _byte);
            var _keyArray, _keyArrayLength;
            
            if (!is_string(_key))
            {
                if (is_array(_key))
                {
                    _keyArray = _key;
                    _keyArrayLength = array_length(_keyArray);
                    
                    if (_keyArrayLength <= 0)
                    {
                        show_error("SNAP:\nStruct key arrays must have at least one element\n ", true);
                    }
                    else if (_keyArrayLength <= 1)
                    {
                        if (!is_string(_keyArray[0]))
                            show_error("SNAP:\nStruct keys must be strings (key was " + string(_keyArray[0]) + ", typeof=" + typeof(_keyArray[0]) + ")\n ", true);
                    }
                }
                else
                {
                    show_error("SNAP:\nStruct keys must be strings (key was " + string(_key) + ", typeof=" + typeof(_key) + ")\n ", true);
                }
            }
            
            while (buffer_tell(arg0) < arg1)
            {
                _byte = buffer_read(arg0, buffer_u8);
                
                if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
                    __SnapBufferReadLooseJSONMultilineComment(arg0, arg1);
                else if (_byte == 58)
                    break;
                else if (_byte > 32)
                    show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a colon\n ", true);
            }
            
            _byte = 0;
            
            while (buffer_tell(arg0) < arg1)
            {
                _byte = buffer_read(arg0, buffer_u8);
                
                if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
                    __SnapBufferReadLooseJSONMultilineComment(arg0, arg1);
                else if (_byte > 32)
                    break;
            }
            
            if (_byte <= 32)
                show_error("SNAP:\nCould not find start of value for key \"" + _key + "\"\n ", true);
            
            var _value = __SnapBufferReadLooseJSONValue(arg0, arg1, _byte);
            
            if (is_string(_key))
            {
                variable_struct_set(_result, _key, _value);
            }
            else
            {
                variable_struct_set(_result, array_get(_keyArray, 0), _value);
                var _i = 1;
                
                repeat (_keyArrayLength - 1)
                {
                    _key = _keyArray[_i];
                    
                    if (!is_string(_key))
                        show_error("SNAP:\nStruct keys must be strings (key was " + string(_key) + ", typeof=" + typeof(_key) + ")\n ", true);
                    
                    variable_struct_set(_result, _key, __SnapBufferReadLooseJSONDeepCopyInner(_value, self, self));
                    _i++;
                }
            }
            
            while (buffer_tell(arg0) < arg1)
            {
                _byte = buffer_read(arg0, buffer_u8);
                
                if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
                    __SnapBufferReadLooseJSONMultilineComment(arg0, arg1);
                else if (_byte == 125)
                    return _result;
                else if (_byte == 44 || _byte == 10 || _byte == 13)
                    break;
                else if (_byte > 32)
                    show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting comma, newline, or closing bracket\n ", true);
            }
        }
    }
    
    show_error("SNAP:\nFound unterminated struct\n ", true);
}

function __SnapBufferReadLooseJSONValue(arg0, arg1, arg2)
{
    if (arg2 == 91)
        return __SnapBufferReadLooseJSONArray(arg0, arg1);
    else if (arg2 == 123)
        return __SnapBufferReadLooseJSONStruct(arg0, arg1);
    else if (arg2 == 34)
        return __SnapBufferReadLooseJSONDelimitedString(arg0, arg1);
    else
        return __SnapBufferReadLooseJSONString(arg0, arg1);
}

function __SnapBufferReadLooseJSONDelimitedString(arg0, arg1)
{
    static _cacheBuffer = buffer_create(1024, buffer_grow, 1);
    
    buffer_seek(_cacheBuffer, buffer_seek_start, 0);
    var _start = buffer_tell(arg0);
    var _stringUsesCache = false;
    
    while (buffer_tell(arg0) < arg1)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 34)
        {
            var _result;
            
            if (_stringUsesCache)
            {
                var _size = buffer_tell(arg0) - _start - 1;
                
                if (_size > 0)
                {
                    buffer_copy(arg0, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                    buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
                }
                
                buffer_write(_cacheBuffer, buffer_u8, 0);
                buffer_seek(_cacheBuffer, buffer_seek_start, 0);
                _result = buffer_read(_cacheBuffer, buffer_string);
            }
            else
            {
                var _end = buffer_tell(arg0) - 1;
                var _oldByte = buffer_peek(arg0, _end, buffer_u8);
                buffer_poke(arg0, _end, buffer_u8, 0);
                _result = buffer_peek(arg0, _start, buffer_string);
                buffer_poke(arg0, _end, buffer_u8, _oldByte);
            }
            
            return _result;
        }
        else if (_byte == 92)
        {
            _stringUsesCache = true;
            var _size = buffer_tell(arg0) - _start - 1;
            
            if (_size > 0)
            {
                buffer_copy(arg0, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
            }
            
            _byte = buffer_read(arg0, buffer_u8);
            
            switch (_byte)
            {
                case 110:
                    buffer_write(_cacheBuffer, buffer_u8, 10);
                    break;
                
                case 114:
                    buffer_write(_cacheBuffer, buffer_u8, 13);
                    break;
                
                case 116:
                    buffer_write(_cacheBuffer, buffer_u8, 9);
                    break;
                
                case 117:
                    var _oldByte = buffer_peek(arg0, buffer_tell(arg0) + 4, buffer_u8);
                    buffer_poke(arg0, buffer_tell(arg0) + 4, buffer_u8, 0);
                    var _hex = buffer_read(arg0, buffer_string);
                    buffer_seek(arg0, buffer_seek_relative, -1);
                    buffer_poke(arg0, buffer_tell(arg0), buffer_u8, _oldByte);
                    var _value = int64(ptr(_hex));
                    
                    if (_value <= 127)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _value);
                    }
                    else if (_value <= 2047)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 192 | ((_value >> 6) & 31));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | (_value & 63));
                    }
                    else if (_value <= 65535)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 192 | (_value & 15));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 4) & 63));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 10) & 63));
                    }
                    else if (_value <= 65536)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 192 | (_value & 7));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 3) & 63));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 9) & 63));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 15) & 63));
                    }
                    
                    break;
                
                default:
                    if ((_byte & 224) == 192)
                    {
                        buffer_copy(arg0, buffer_tell(arg0) + 1, 1, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(arg0, buffer_seek_relative, 1);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 1);
                    }
                    else if ((_byte & 240) == 224)
                    {
                        buffer_copy(arg0, buffer_tell(arg0) + 1, 2, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(arg0, buffer_seek_relative, 2);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 2);
                    }
                    else if ((_byte & 248) == 240)
                    {
                        buffer_copy(arg0, buffer_tell(arg0) + 1, 3, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(arg0, buffer_seek_relative, 3);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 3);
                    }
                    else
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _byte);
                    }
                    
                    break;
            }
            
            _start = buffer_tell(arg0);
        }
    }
    
    show_error("SNAP:\nFound unterminated string\n ", true);
}

function __SnapBufferReadLooseJSONString(arg0, arg1)
{
    static _cacheBuffer = buffer_create(1024, buffer_grow, 1);
    
    buffer_seek(_cacheBuffer, buffer_seek_start, 0);
    var _result = undefined;
    var _start = buffer_tell(arg0) - 1;
    var _end = _start + 1;
    var _stringUsesCache = false;
    
    while (buffer_tell(arg0) < arg1)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 58 || _byte == 44 || _byte == 125 || _byte == 93 || _byte == 10 || _byte == 13 || (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42))
        {
            if (_stringUsesCache)
            {
                var _size = _end - _start;
                
                if (_size > 0)
                {
                    buffer_copy(arg0, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                    buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
                }
                
                buffer_write(_cacheBuffer, buffer_u8, 0);
                buffer_seek(_cacheBuffer, buffer_seek_start, 0);
                _result = buffer_read(_cacheBuffer, buffer_string);
            }
            else
            {
                var _oldByte = buffer_peek(arg0, _end, buffer_u8);
                buffer_poke(arg0, _end, buffer_u8, 0);
                _result = buffer_peek(arg0, _start, buffer_string);
                buffer_poke(arg0, _end, buffer_u8, _oldByte);
                
                if (_result == "true")
                {
                    _result = true;
                }
                else if (_result == "false")
                {
                    _result = false;
                }
                else if (_result == "null")
                {
                    _result = undefined;
                }
                else
                {
                    try
                    {
                        _result = real(_result);
                    }
                    catch (_error)
                    {
                    }
                }
            }
            
            buffer_seek(arg0, buffer_seek_relative, -1);
            
            if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
                __SnapBufferReadLooseJSONMultilineComment(arg0, arg1);
            
            return _result;
        }
        else if (_byte == 92)
        {
            _stringUsesCache = true;
            var _size = buffer_tell(arg0) - _start - 1;
            
            if (_size > 0)
            {
                buffer_copy(arg0, _start, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
            }
            
            _byte = buffer_read(arg0, buffer_u8);
            
            switch (_byte)
            {
                case 110:
                    buffer_write(_cacheBuffer, buffer_u8, 10);
                    break;
                
                case 114:
                    buffer_write(_cacheBuffer, buffer_u8, 13);
                    break;
                
                case 116:
                    buffer_write(_cacheBuffer, buffer_u8, 9);
                    break;
                
                case 117:
                    var _oldByte = buffer_peek(arg0, buffer_tell(arg0) + 4, buffer_u8);
                    buffer_poke(arg0, buffer_tell(arg0) + 4, buffer_u8, 0);
                    var _hex = buffer_read(arg0, buffer_string);
                    buffer_seek(arg0, buffer_seek_relative, -1);
                    buffer_poke(arg0, buffer_tell(arg0), buffer_u8, _oldByte);
                    var _value = int64(ptr(_hex));
                    
                    if (_value <= 127)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _value);
                    }
                    else if (_value <= 2047)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 192 | ((_value >> 6) & 31));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | (_value & 63));
                    }
                    else if (_value <= 65535)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 192 | (_value & 15));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 4) & 63));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 10) & 63));
                    }
                    else if (_value <= 65536)
                    {
                        buffer_write(_cacheBuffer, buffer_u8, 192 | (_value & 7));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 3) & 63));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 9) & 63));
                        buffer_write(_cacheBuffer, buffer_u8, 128 | ((_value >> 15) & 63));
                    }
                    
                    break;
                
                default:
                    if ((_byte & 224) == 192)
                    {
                        buffer_copy(arg0, buffer_tell(arg0) + 1, 1, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(arg0, buffer_seek_relative, 1);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 1);
                    }
                    else if ((_byte & 240) == 224)
                    {
                        buffer_copy(arg0, buffer_tell(arg0) + 1, 2, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(arg0, buffer_seek_relative, 2);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 2);
                    }
                    else if ((_byte & 248) == 240)
                    {
                        buffer_copy(arg0, buffer_tell(arg0) + 1, 3, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(arg0, buffer_seek_relative, 3);
                        buffer_seek(_cacheBuffer, buffer_seek_relative, 3);
                    }
                    else
                    {
                        buffer_write(_cacheBuffer, buffer_u8, _byte);
                    }
                    
                    break;
            }
            
            _start = buffer_tell(arg0);
        }
        else if (_byte > 32)
        {
            _end = buffer_tell(arg0);
        }
    }
    
    show_error("SNAP:\nFound unterminated value\n ", true);
}

function __SnapBufferReadLooseJSONComment(arg0, arg1)
{
    while (buffer_tell(arg0) < arg1)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 10 || _byte == 13)
        {
            buffer_seek(arg0, buffer_seek_relative, -1);
            break;
        }
    }
}

function __SnapBufferReadLooseJSONMultilineComment(arg0, arg1)
{
    while (buffer_tell(arg0) < arg1)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 42)
        {
            _byte = buffer_read(arg0, buffer_u8);
            
            if (_byte == 47)
                break;
        }
    }
}

function __SnapBufferReadLooseJSONDeepCopyInner(arg0, arg1, arg2)
{
    var _copy = arg0;
    
    if (is_method(arg0))
    {
        var _self = method_get_self(arg0);
        
        if (_self == arg1)
            arg0 = method(arg2, method_get_index(arg0));
        else if (_self != undefined)
            trace("SnapDeepCopy(): Warning! Deep copy found a method reference that could not be appropriately handled");
    }
    else if (is_struct(arg0))
    {
        var _namesArray = variable_struct_get_names(arg0);
        _copy = {};
        var _i = 0;
        
        repeat (array_length(_namesArray))
        {
            var _name = _namesArray[_i];
            variable_struct_set(_copy, _name, __SnapBufferReadLooseJSONDeepCopyInner(variable_struct_get(arg0, _name), arg0, _copy));
            _i++;
        }
    }
    else if (is_array(arg0))
    {
        var _count = array_length(arg0);
        _copy = array_create(_count);
        var _i = 0;
        
        repeat (_count)
        {
            _copy[_i] = __SnapBufferReadLooseJSONDeepCopyInner(arg0[_i], arg1, arg2);
            _i++;
        }
    }
    
    return _copy;
}
