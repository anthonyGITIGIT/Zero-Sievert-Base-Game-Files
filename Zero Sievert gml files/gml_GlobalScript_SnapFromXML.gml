function SnapFromXML(arg0)
{
    var _buffer = buffer_create(string_byte_length(arg0), buffer_fixed, 1);
    buffer_write(_buffer, buffer_text, arg0);
    var _data = SnapBufferReadXML(_buffer, 0, buffer_get_size(_buffer));
    buffer_delete(_buffer);
    return _data;
}
