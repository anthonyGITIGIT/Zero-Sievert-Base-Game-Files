function ds_list_print(arg0)
{
    var _str = "";
    var _list = arg0;
    var _size = ds_list_size(_list);
    
    for (var _i = 0; _i < _size; _i++)
        _str = _str + "[" + string(ds_list_find_value(_list, _i)) + "] ";
    
    return _str;
}

function ds_grid_print(arg0)
{
    var _str = "";
    var _width = ds_grid_width(arg0);
    var _height = ds_grid_height(arg0);
    
    for (var _y = 0; _y < _height; _y++)
    {
        for (var _x = 0; _x < _width; _x++)
            _str = _str + "[" + string(ds_grid_get(arg0, _x, _y)) + "] ";
        
        _str = _str + "\n";
    }
    
    return _str;
}

function debug_output()
{
}
