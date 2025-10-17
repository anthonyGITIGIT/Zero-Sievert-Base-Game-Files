function SnapBufferReadVDF(arg0, arg1 = undefined, arg2 = undefined)
{
    var _oldOffset;
    
    if (arg1 != undefined)
    {
        _oldOffset = buffer_tell(arg0);
        buffer_seek(arg0, buffer_seek_start, arg1);
    }
    
    var _size = arg2 ?? (buffer_get_size(arg0) - buffer_tell(arg0));
    var _cacheBuffer = undefined;
    var _readStart = undefined;
    var _inString = false;
    var _stringUsesCache = false;
    var _inStructKey = true;
    var _structKey = undefined;
    var _inStructValue = false;
    var _inComment = false;
    var _inMultilineComment = false;
    var _root = {};
    var _stackTop = _root;
    var _stack = [_stackTop];
    
    while (buffer_tell(arg0) < _size)
    {
        var _byte = buffer_read(arg0, buffer_u8);
        
        if (_byte == 0)
            break;
        
        if (_inComment)
        {
            if (_byte == 10 || _byte == 13)
                _inComment = false;
        }
        else if (_inMultilineComment)
        {
            if (_byte == 42 && buffer_read(arg0, buffer_u8) == 47)
                _inMultilineComment = false;
        }
        else if (_inString)
        {
            if (_byte == 34)
            {
                var _value;
                
                if (_stringUsesCache)
                {
                    _stringUsesCache = false;
                    _size = buffer_tell(arg0) - _readStart - 1;
                    
                    if (_size > 0)
                    {
                        buffer_copy(arg0, _readStart, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                        buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
                    }
                    
                    buffer_write(_cacheBuffer, buffer_u8, 0);
                    buffer_seek(_cacheBuffer, buffer_seek_start, 0);
                    _value = buffer_read(_cacheBuffer, buffer_string);
                }
                else
                {
                    buffer_poke(arg0, buffer_tell(arg0) - 1, buffer_u8, 0);
                    buffer_seek(arg0, buffer_seek_start, _readStart);
                    _value = buffer_read(arg0, buffer_string);
                }
                
                _inString = false;
                _stringUsesCache = false;
                
                if (_inStructKey)
                {
                    _structKey = _value;
                    _inStructKey = false;
                    _inStructValue = true;
                }
                else if (_inStructValue)
                {
                    variable_struct_set(_stackTop, _structKey, _value);
                    _structKey = undefined;
                    _inStructKey = true;
                    _inStructValue = false;
                }
            }
            else if (_byte == 92)
            {
                if (!_stringUsesCache)
                {
                    _stringUsesCache = true;
                    
                    if (_cacheBuffer == undefined)
                        _cacheBuffer = buffer_create(1024, buffer_grow, 1);
                    else
                        buffer_seek(_cacheBuffer, buffer_seek_start, 0);
                }
                
                _size = buffer_tell(arg0) - _readStart - 1;
                
                if (_size > 0)
                {
                    buffer_copy(arg0, _readStart, _size, _cacheBuffer, buffer_tell(_cacheBuffer));
                    buffer_seek(_cacheBuffer, buffer_seek_relative, _size);
                }
                
                var _next_byte = buffer_read(arg0, buffer_u8);
                
                switch (_next_byte)
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
                        var _old_value = buffer_peek(arg0, buffer_tell(arg0) + 4, buffer_u8);
                        buffer_poke(arg0, buffer_tell(arg0) + 4, buffer_u8, 0);
                        var _hex = buffer_read(arg0, buffer_string);
                        buffer_seek(arg0, buffer_seek_relative, -1);
                        buffer_poke(arg0, buffer_tell(arg0), buffer_u8, _old_value);
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
                        if ((_next_byte & 224) == 192)
                        {
                            buffer_copy(arg0, buffer_tell(arg0) + 1, 1, _cacheBuffer, buffer_tell(_cacheBuffer));
                            buffer_seek(arg0, buffer_seek_relative, 1);
                            buffer_seek(_cacheBuffer, buffer_seek_relative, 1);
                        }
                        else if ((_next_byte & 240) == 224)
                        {
                            buffer_copy(arg0, buffer_tell(arg0) + 1, 2, _cacheBuffer, buffer_tell(_cacheBuffer));
                            buffer_seek(arg0, buffer_seek_relative, 2);
                            buffer_seek(_cacheBuffer, buffer_seek_relative, 2);
                        }
                        else if ((_next_byte & 248) == 240)
                        {
                            buffer_copy(arg0, buffer_tell(arg0) + 1, 3, _cacheBuffer, buffer_tell(_cacheBuffer));
                            buffer_seek(arg0, buffer_seek_relative, 3);
                            buffer_seek(_cacheBuffer, buffer_seek_relative, 3);
                        }
                        else
                        {
                            buffer_write(_cacheBuffer, buffer_u8, _next_byte);
                        }
                        
                        break;
                }
                
                _readStart = buffer_tell(arg0);
            }
        }
        else
        {
            switch (_byte)
            {
                case 34:
                    _readStart = buffer_tell(arg0);
                    _inString = true;
                    break;
                
                case 123:
                    if (_inStructKey)
                    {
                        show_error("SNAP:\nCannot use a struct as a struct key\n ", true);
                    }
                    else
                    {
                        var _new_stack_top = {};
                        
                        if (_inStructValue)
                            variable_struct_set(_stackTop, _structKey, _new_stack_top);
                        
                        array_push(_stack, _new_stack_top);
                        _stackTop = _new_stack_top;
                        _inStructKey = true;
                        _inStructValue = false;
                    }
                    
                    break;
                
                case 125:
                    if (_inStructKey || _inStructValue)
                    {
                        array_pop(_stack);
                        _stackTop = (array_length(_stack) <= 0) ? undefined : _stack[array_length(_stack) - 1];
                        
                        if (is_struct(_stackTop))
                        {
                            _inStructKey = true;
                            _inStructValue = false;
                        }
                    }
                    else
                    {
                        show_error("SNAP:\nFound unexpected }\n ", true);
                    }
                    
                    break;
                
                default:
                    if (_byte == 47)
                    {
                        var _next_byte = buffer_peek(arg0, buffer_tell(arg0), buffer_u8);
                        
                        if (_next_byte == 47)
                        {
                            _inComment = true;
                            buffer_seek(arg0, buffer_seek_relative, 1);
                        }
                        else if (_next_byte == 42)
                        {
                            _inMultilineComment = true;
                            buffer_seek(arg0, buffer_seek_relative, 1);
                        }
                    }
                    else if (_byte > 32)
                    {
                        show_error("SNAP:\nKeys and values must be strings\n ", true);
                    }
                    else if ((_inStructValue && _byte == 10) || _byte == 13)
                    {
                        show_error("SNAP:\nWas expecting a value, found a newline instead\n ", true);
                    }
                    
                    break;
            }
        }
    }
    
    if (_cacheBuffer != undefined)
        buffer_delete(_cacheBuffer);
    
    if (array_length(_stack) > 1)
        show_error("SNAP:\nOne or more VDF objects not terminataed\n ", true);
    
    if (arg1 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
    
    return _root;
}
