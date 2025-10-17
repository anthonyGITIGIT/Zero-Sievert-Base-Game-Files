function SnapDeepAdd(arg0, arg1, arg2 = false)
{
    if (is_struct(arg0))
    {
        if (!is_struct(arg1))
            show_error("SNAP:\nSource is a struct but destination is not a struct (=" + typeof(arg1) + ")", true);
        
        var _srcNames = variable_struct_get_names(arg0);
        var _i = 0;
        
        repeat (array_length(_srcNames))
        {
            var _name = _srcNames[_i];
            var _srcValue = variable_struct_get(arg0, _name);
            var _dstValue = variable_struct_get(arg1, _name);
            
            if (is_struct(_srcValue))
            {
                if (!is_struct(_dstValue))
                {
                    _dstValue = {};
                    variable_struct_set(arg1, _name, _dstValue);
                }
                
                SnapDeepAdd(_srcValue, _dstValue);
            }
            else if (is_array(_srcValue))
            {
                if (!is_array(_dstValue))
                {
                    _dstValue = [];
                    variable_struct_set(arg1, _name, _dstValue);
                }
                
                SnapDeepAdd(_srcValue, _dstValue);
            }
            else if (is_numeric(_srcValue))
            {
                if (!is_numeric(_dstValue))
                    _dstValue = 0;
                
                variable_struct_set(arg1, _name, _dstValue + _srcValue);
            }
            else if (!arg2)
            {
                show_error("SNAP:\nA value in the source data structure is not a number", true);
            }
            
            _i++;
        }
    }
    else if (is_array(arg0))
    {
        if (!is_array(arg1))
            show_error("SNAP:\nSource is an array but destination is not an array (=" + typeof(arg1) + ")", true);
        
        var _srcLength = array_length(arg0);
        var _dstLength = array_length(arg1);
        
        if (_srcLength > _dstLength)
            array_resize(arg1, _srcLength);
        
        var _i = 0;
        
        repeat (array_length(_srcLength))
        {
            var _srcValue = arg0[_i];
            var _dstValue = arg1[_i];
            
            if (is_struct(_srcValue))
            {
                if (!is_struct(_dstValue))
                {
                    _dstValue = {};
                    arg1[_i] = _dstValue;
                }
                
                SnapDeepAdd(_srcValue, _dstValue);
            }
            else if (is_array(_srcValue))
            {
                if (!is_array(_dstValue))
                {
                    _dstValue = [];
                    arg1[_i] = _dstValue;
                }
                
                SnapDeepAdd(_srcValue, _dstValue);
            }
            else if (is_numeric(_srcValue))
            {
                if (!is_numeric(_dstValue))
                    _dstValue = 0;
                
                arg1[_i] = _dstValue + _srcValue;
            }
            else if (!arg2)
            {
                show_error("SNAP:\nA value in the source data structure is not a number", true);
            }
            
            _i++;
        }
    }
    else
    {
        show_error("SNAP:\nSource data structure is not a struct or array", true);
    }
}
