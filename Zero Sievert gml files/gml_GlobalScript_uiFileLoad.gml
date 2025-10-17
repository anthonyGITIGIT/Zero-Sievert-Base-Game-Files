function uiFileLoad(arg0)
{
    if (is_array(arg0))
    {
        var _array = arg0;
        var _i = 0;
        
        repeat (array_length(_array))
        {
            uiFileLoad(_array[_i]);
            _i++;
        }
        
        exit;
    }
    
    return __uiFileEnsure(arg0).__Load(true);
}
