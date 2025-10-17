function SnapToXML(arg0)
{
    var _buffer = buffer_create(1024, buffer_grow, 1);
    SnapBufferWriteXML(_buffer, arg0);
    buffer_seek(_buffer, buffer_seek_start, 0);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    return _string;
}
