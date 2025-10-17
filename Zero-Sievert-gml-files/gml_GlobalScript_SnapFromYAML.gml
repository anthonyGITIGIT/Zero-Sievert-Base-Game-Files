function SnapFromYAML(arg0, arg1 = true, arg2 = false, arg3 = 2)
{
    var _buffer = buffer_create(string_byte_length(arg0), buffer_fixed, 1);
    buffer_write(_buffer, buffer_text, arg0);
    var _data = SnapBufferReadYAML(_buffer, 0, arg1, arg2, arg3);
    buffer_delete(_buffer);
    return _data;
}
