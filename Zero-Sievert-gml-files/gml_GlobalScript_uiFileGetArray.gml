function uiFileGetArray()
{
    static _sourceArray = __uiGlobal().__fileArray;
    
    var _size = array_length(_sourceArray);
    var _array = array_create(_size);
    var _i = 0;
    
    repeat (_size)
    {
        _array[_i] = _sourceArray[_i].__path;
        _i++;
    }
    
    return _array;
}
