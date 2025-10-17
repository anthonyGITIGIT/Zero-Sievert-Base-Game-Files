function building_index_save(arg0, arg1)
{
    var _struct = 
    {
        building_index: global.building_filename_dict,
        metadata: arg1
    };
    var _buffer = buffer_create(1024, buffer_grow, 1);
    SnapBufferWriteJSON(_buffer, _struct, true, true, false);
    buffer_save_ext(_buffer, arg0, 0, buffer_tell(_buffer));
    buffer_delete(_buffer);
}
