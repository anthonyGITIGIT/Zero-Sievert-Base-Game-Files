function SnapBufferReadQML(arg0, arg1, arg2 = false, arg3 = undefined)
{
    var _oldOffset;
    
    if (arg3 != undefined)
    {
        _oldOffset = buffer_tell(arg0);
        buffer_seek(arg0, buffer_seek_start, arg3);
    }
    
    var _bufferSize = buffer_get_size(arg0);
    var _result = undefined;
    
    while (buffer_tell(arg0) < _bufferSize)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 47)
        {
            __SnapBufferReadQMLComment(arg0, arg1, arg2, _bufferSize);
        }
        else if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
        {
            __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, _bufferSize);
        }
        else if (_byte == 91 || _byte == 93 || _byte == 34 || _byte == 123 || _byte == 125)
        {
            show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting struct class name\n ", true);
        }
        else if (_byte > 32)
        {
            _result = __SnapBufferReadQMLValue(arg0, arg1, arg2, _bufferSize, _byte);
            break;
        }
    }
    
    if (arg3 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
    
    return _result;
}

function __SnapBufferReadQMLArray(arg0, arg1, arg2, arg3)
{
    var _result = [];
    
    while (buffer_tell(arg0) < arg3)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 47)
        {
            __SnapBufferReadQMLComment(arg0, arg1, arg2, arg3);
        }
        else if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
        {
            __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, arg3);
        }
        else if (_byte == 93)
        {
            return _result;
        }
        else if (_byte == 58 || _byte == 59)
        {
            show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a value\n ", true);
        }
        else if (_byte > 32)
        {
            var _value = __SnapBufferReadQMLValue(arg0, arg1, arg2, arg3, _byte);
            array_push(_result, _value);
            
            while (buffer_tell(arg0) < arg3)
            {
                _byte = buffer_read(arg0, buffer_u8);
                
                if (_byte == 93)
                    return _result;
                else if (_byte == 59 || _byte == 10 || _byte == 13)
                    break;
                else if (_byte > 32)
                    show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting comma, newline, or closing bracket\n ", true);
            }
        }
    }
    
    show_error("SNAP:\nFound unterminated array\n ", true);
}

function __SnapBufferReadQMLStruct(arg0, arg1, arg2, arg3, arg4)
{
    var _childrenArrayVariableName = "children";
    
    while (buffer_tell(arg0) < arg3)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 47)
        {
            __SnapBufferReadQMLComment(arg0, arg1, arg2, arg3);
        }
        else if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
        {
            __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, arg3);
        }
        else if (_byte == 125)
        {
            return arg4;
        }
        else if (_byte == 58 || _byte == 59)
        {
            show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a key\n ", true);
        }
        else if (_byte > 32)
        {
            var _key = __SnapBufferReadQMLValue(arg0, arg1, arg2, arg3, _byte);
            
            if (is_struct(_key))
            {
                if (variable_struct_exists(arg4, _childrenArrayVariableName))
                {
                    if (!is_array(variable_struct_get(arg4, _childrenArrayVariableName)))
                        show_error("SNAP:\n." + string(_childrenArrayVariableName) + " variable for struct exists already but is not an array\n ", true);
                }
                else
                {
                    variable_struct_set(arg4, _childrenArrayVariableName, []);
                }
                
                array_push(variable_struct_get(arg4, _childrenArrayVariableName), _key);
            }
            else
            {
                if (!is_string(_key))
                    show_error("SNAP:\nStruct keys must be strings (key was " + string(_key) + ", typeof=" + typeof(_key) + ")\n ", true);
                
                while (buffer_tell(arg0) < arg3)
                {
                    _byte = buffer_read(arg0, buffer_u8);
                    
                    if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
                        __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, arg3);
                    else if (_byte == 58)
                        break;
                    else if (_byte > 32)
                        show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting a colon\n ", true);
                }
                
                _byte = 0;
                
                while (buffer_tell(arg0) < arg3)
                {
                    _byte = buffer_read(arg0, buffer_u8);
                    
                    if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
                        __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, arg3);
                    else if (_byte > 32)
                        break;
                }
                
                if (_byte <= 32)
                    show_error("SNAP:\nCould not find start of value for key \"" + _key + "\"\n ", true);
                
                var _value = __SnapBufferReadQMLValue(arg0, arg1, arg2, arg3, _byte);
                variable_struct_set(arg4, _key, _value);
            }
            
            while (buffer_tell(arg0) < arg3)
            {
                _byte = buffer_read(arg0, buffer_u8);
                
                if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
                    __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, arg3);
                else if (_byte == 125)
                    return arg4;
                else if (_byte == 59 || _byte == 10 || _byte == 13)
                    break;
                else if (_byte > 32)
                    show_error("SNAP:\nFound unexpected character " + chr(_byte) + " (decimal=" + string(_byte) + ")\nWas expecting comma, newline, or closing bracket\n ", true);
            }
        }
    }
    
    show_error("SNAP:\nFound unterminated struct\n ", true);
}

function __SnapBufferReadQMLValue(arg0, arg1, arg2, arg3, arg4)
{
    if (arg4 == 91)
        return __SnapBufferReadQMLArray(arg0, arg1, arg2, arg3);
    else if (arg4 == 123)
        show_error("SNAP:\nStructs must have a class name\n ", true);
    else if (arg4 == 34)
        return __SnapBufferReadQMLDelimitedString(arg0, arg1, arg2, arg3);
    else
        return __SnapBufferReadQMLString(arg0, arg1, arg2, arg3);
}

function __SnapBufferReadQMLString(arg0, arg1, arg2, arg3)
{
    static _cacheBuffer = buffer_create(1024, buffer_grow, 1);
    
    buffer_seek(_cacheBuffer, buffer_seek_start, 0);
    var _result = undefined;
    var _start = buffer_tell(arg0) - 1;
    var _end = _start + 1;
    var _stringUsesCache = false;
    
    while (buffer_tell(arg0) < arg3)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 58 || _byte == 59 || _byte == 123 || _byte == 125 || _byte == 93 || _byte == 10 || _byte == 13 || (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42))
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
            
            if (_byte == 123)
            {
                buffer_seek(arg0, buffer_seek_relative, 1);
                
                if (!is_string(_result))
                    show_error("SNAP:\nStruct class names must be strings (typeof=" + typeof(_result) + ")\n ", true);
                
                var _constructor = variable_struct_get(arg1, _result);
                
                if (arg2 && _constructor == undefined)
                    _constructor = asset_get_index(_result);
                
                if (is_numeric(_constructor))
                {
                    if (!script_exists(_constructor))
                        show_error("SNAP:\nStruct class name \"" + string(_result) + "\" has script index " + string(_constructor) + " but this script doesn't exist\n ", true);
                    
                    _result = __SnapBufferReadQMLStruct(arg0, arg1, arg2, arg3, new _constructor());
                }
                else if (is_method(_constructor))
                {
                    _result = __SnapBufferReadQMLStruct(arg0, arg1, arg2, arg3, new _constructor());
                }
                else if (is_undefined(_constructor))
                {
                    show_error("SNAP:\nFound undefined struct class name \"" + string(_result) + "\"\n ", true);
                }
                else
                {
                    show_error("SNAP:\nFound invalid struct class name \"" + string(_result) + "\"\n ", true);
                }
            }
            else if (_byte == 47 && buffer_peek(arg0, buffer_tell(arg0), buffer_u8) == 42)
            {
                __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, arg3);
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
        else if (_byte > 32)
        {
            _end = buffer_tell(arg0);
        }
    }
    
    show_error("SNAP:\nFound unterminated value\n ", true);
}

function __SnapBufferReadQMLDelimitedString(arg0, arg1, arg2, arg3)
{
    static _cacheBuffer = buffer_create(1024, buffer_grow, 1);
    
    buffer_seek(_cacheBuffer, buffer_seek_start, 0);
    var _start = buffer_tell(arg0);
    var _stringUsesCache = false;
    
    while (buffer_tell(arg0) < arg3)
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

function __SnapBufferReadQMLComment(arg0, arg1, arg2, arg3)
{
    while (buffer_tell(arg0) < arg3)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 10 || _byte == 13)
        {
            buffer_seek(arg0, buffer_seek_relative, -1);
            break;
        }
    }
}

function __SnapBufferReadQMLMultilineComment(arg0, arg1, arg2, arg3)
{
    while (buffer_tell(arg0) < arg3)
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
