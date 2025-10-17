function Snap2DArrayToStructArray(arg0, arg1 = {})
{
    var _outputArray = array_create(array_length(arg0) - 1);
    var _headerArray = arg0[0];
    var _ignore = false;
    var _numeric = false;
    var _i = 1;
    
    repeat (array_length(arg0) - 1)
    {
        var _struct = {};
        _outputArray[_i - 1] = _struct;
        var _subArray = arg0[_i];
        var _j = 0;
        
        repeat (array_length(_subArray))
        {
            var _value = _subArray[_j];
            var _variableName = _headerArray[_j];
            var _config = variable_struct_get(arg1, _variableName);
            
            if (is_struct(_config))
            {
                _ignore = struct_get_from_hash(_config, variable_get_hash("ignore")) ?? false;
                _numeric = struct_get_from_hash(_config, variable_get_hash("numeric")) ?? false;
            }
            
            if (_numeric)
            {
                _numeric = false;
                
                try
                {
                    _value = real(_value);
                }
                catch (_error)
                {
                }
            }
            
            if (_ignore)
                _ignore = false;
            else
                variable_struct_set(_struct, _variableName, _value);
            
            _j++;
        }
        
        _i++;
    }
    
    return _outputArray;
}
