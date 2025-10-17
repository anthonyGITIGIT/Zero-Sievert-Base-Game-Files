function SnapFromCSV(arg0, arg1 = ",", arg2 = "\"")
{
    var _buffer = buffer_create(string_byte_length(arg0) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, arg0);
    var _data = SnapBufferReadCSV(_buffer, 0, buffer_get_size(_buffer), arg1, arg2);
    buffer_delete(_buffer);
    return _data;
}
