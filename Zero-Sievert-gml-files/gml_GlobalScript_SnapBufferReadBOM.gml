function SnapBufferReadBOM(arg0)
{
    var _tell = buffer_tell(arg0);
    
    if (buffer_get_size(arg0) >= 3 && buffer_peek(arg0, _tell, buffer_u8) == 239 && buffer_peek(arg0, _tell + 1, buffer_u8) == 187 && buffer_peek(arg0, _tell + 2, buffer_u8) == 191)
    {
        buffer_seek(arg0, buffer_seek_relative, 3);
        return true;
    }
    
    return false;
}
