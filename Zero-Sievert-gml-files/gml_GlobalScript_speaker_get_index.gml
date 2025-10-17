function speaker_get_index(arg0)
{
    var _struct = variable_struct_get(global.speaker_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Speaker \"", arg0, "\" not recognised");
    
    return _struct.index;
}
