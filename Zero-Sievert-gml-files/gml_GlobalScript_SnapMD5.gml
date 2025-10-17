function SnapMD5(arg0)
{
    var _buffer = buffer_create(1024, buffer_grow, 1);
    SnapBufferWriteBinary(_buffer, arg0, true);
    var _hash = buffer_md5(_buffer, 0, buffer_tell(_buffer));
    buffer_delete(_buffer);
    return _hash;
}
