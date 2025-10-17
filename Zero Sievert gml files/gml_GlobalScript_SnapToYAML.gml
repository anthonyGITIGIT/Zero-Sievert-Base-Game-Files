function SnapToYAML(arg0, arg1 = false, arg2 = false)
{
    var _buffer = buffer_create(1024, buffer_grow, 1);
    SnapBufferWriteYAML(_buffer, arg0, arg1, arg2);
    buffer_seek(_buffer, buffer_seek_start, 0);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    return _string;
}
