function SnapBufferReadCSV(arg0, arg1, arg2 = undefined, arg3 = ",", arg4 = "\"")
{
    var _oldOffset;
    
    if (arg1 != undefined)
    {
        _oldOffset = buffer_tell(arg0);
        buffer_seek(arg0, buffer_seek_start, arg1);
    }
    
    var _size = arg2 ?? (buffer_get_size(arg0) - buffer_tell(arg0));
    var _restorePos = _size + buffer_tell(arg0);
    var _restoreByte = undefined;
    
    if (_restorePos < buffer_get_size(arg0))
    {
        _restoreByte = buffer_peek(arg0, _restorePos, buffer_u8);
        buffer_poke(arg0, _restorePos, buffer_u8, 0);
    }
    else
    {
        buffer_resize(arg0, buffer_get_size(arg0) + 1);
    }
    
    var _cellDelimiterOrd = ord(arg3);
    var _stringDelimiterDouble = arg4 + arg4;
    var _stringDelimiterOrd = ord(arg4);
    var _rootArray = [];
    var _rowArray = undefined;
    var _newline = false;
    var _read = false;
    var _wordStart = 0;
    var _inString = false;
    var _stringCell = false;
    
    repeat (_size + 1)
    {
        var _value = buffer_read(arg0, buffer_u8);
        
        if (_value == _stringDelimiterOrd)
        {
            _inString = !_inString;
            
            if (_inString)
                _stringCell = true;
        }
        else
        {
            if (_value == 0)
            {
                if (_inString)
                    _stringCell = true;
                
                _inString = false;
                var _prev_value = buffer_peek(arg0, buffer_tell(arg0) - 2, buffer_u8);
                
                if (_prev_value != _cellDelimiterOrd && _prev_value != 10 && _prev_value != 13)
                    _read = true;
                else
                    break;
            }
            
            if (!_inString)
            {
                if (_value == 10 || _value == 13)
                {
                    var _prev_value = buffer_peek(arg0, buffer_tell(arg0) - 2, buffer_u8);
                    
                    if (_prev_value != 10 && _prev_value != 13)
                    {
                        _newline = true;
                        
                        if (_prev_value != _cellDelimiterOrd)
                            _read = true;
                        else
                            _wordStart++;
                    }
                    else
                    {
                        _wordStart++;
                    }
                }
                
                if (_read || _value == _cellDelimiterOrd)
                {
                    _read = false;
                    var _tell = buffer_tell(arg0);
                    var _old_value = buffer_peek(arg0, _tell - 1, buffer_u8);
                    buffer_poke(arg0, _tell - 1, buffer_u8, 0);
                    buffer_seek(arg0, buffer_seek_start, _wordStart);
                    var _string = buffer_read(arg0, buffer_string);
                    buffer_poke(arg0, _tell - 1, buffer_u8, _old_value);
                    
                    if (_stringCell)
                    {
                        if (string_byte_at(_string, 1) == _stringDelimiterOrd && string_byte_at(_string, string_byte_length(_string)) == _stringDelimiterOrd)
                            _string = string_copy(_string, 2, string_length(_string) - 2);
                    }
                    
                    _string = string_replace_all(_string, _stringDelimiterDouble, arg4);
                    
                    if (_rowArray == undefined)
                    {
                        _rowArray = [];
                        _rootArray[array_length(_rootArray)] = _rowArray;
                    }
                    
                    _rowArray[array_length(_rowArray)] = _string;
                    _stringCell = false;
                    _wordStart = _tell;
                    
                    if (_value == 0)
                        break;
                }
                
                if (_newline)
                {
                    _newline = false;
                    _rowArray = undefined;
                }
            }
        }
    }
    
    if (_restoreByte == undefined)
        buffer_resize(arg0, buffer_get_size(arg0) - 1);
    else
        buffer_poke(arg0, _restorePos, buffer_u8, _restoreByte);
    
    if (arg1 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
    
    return _rootArray;
}
