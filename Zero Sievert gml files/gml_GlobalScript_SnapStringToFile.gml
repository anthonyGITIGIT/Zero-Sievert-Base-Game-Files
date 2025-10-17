function SnapStringToFile(arg0, arg1, arg2 = false)
{
    var _buffer = buffer_create(string_byte_length(arg0) + (arg2 ? 3 : 0), buffer_fixed, 1);
    
    if (arg2)
    {
        buffer_write(_buffer, buffer_u32, 12565487);
        buffer_seek(_buffer, buffer_seek_relative, -1);
    }
    
    buffer_write(_buffer, buffer_text, arg0);
    var _result = buffer_save(_buffer, arg1);
    buffer_delete(_buffer);
    return _result;
}
