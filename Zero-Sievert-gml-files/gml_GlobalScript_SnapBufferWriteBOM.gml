function SnapBufferWriteBOM(arg0)
{
    buffer_write(arg0, buffer_u8, 239);
    buffer_write(arg0, buffer_u8, 187);
    buffer_write(arg0, buffer_u8, 191);
}
