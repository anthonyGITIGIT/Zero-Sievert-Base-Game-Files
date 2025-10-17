function from_precisione_to_offset(arg0)
{
    var _acc = clamp(arg0, 0, 100);
    var _offset = (100 - _acc) / 2;
    return _offset;
}
