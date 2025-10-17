function SnapFromQML(arg0, arg1, arg2 = false)
{
    var _buffer = buffer_create(string_byte_length(arg0), buffer_fixed, 1);
    buffer_write(_buffer, buffer_text, arg0);
    var _data = SnapBufferReadQML(_buffer, arg1, arg2, 0);
    buffer_delete(_buffer);
    return _data;
}
