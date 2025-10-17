function SnapMerge(arg0, arg1, arg2 = false)
{
    if (is_struct(arg1))
    {
        if (!is_struct(arg0))
            show_error("SNAP:\nRoot destination data structure is a struct but source is not (typeof=" + typeof(arg0) + ")", true);
    }
    else if (is_array(arg1))
    {
        if (!is_array(arg0))
            show_error("SNAP:\nRoot destination data structure is an array but source is not (typeof=" + typeof(arg0) + ")", true);
    }
    else
    {
        show_error("SNAP:\nRoot destination data structure is not a struct or an array", true);
    }
    
    __SnapMerge(arg0, arg1, arg2);
}

function __SnapMerge(arg0, arg1, arg2)
{
    if (is_struct(arg0))
    {
        if (!is_struct(arg1))
        {
            return arg2 ? arg0 : arg1;
        }
        else
        {
            var _srcNames = variable_struct_get_names(arg0);
            var _i = 0;
            
            repeat (array_length(_srcNames))
            {
                var _name = _srcNames[_i];
                var _srcValue = variable_struct_get(arg0, _name);
                
                if (variable_struct_exists(arg1, _name))
                    variable_struct_set(arg1, _name, __SnapMerge(_srcValue, variable_struct_get(arg1, _name), arg2));
                else
                    variable_struct_set(arg1, _name, _srcValue);
                
                _i++;
            }
            
            return arg1;
        }
    }
    else if (is_array(arg0))
    {
        if (!is_array(arg1))
        {
            return arg2 ? arg0 : arg1;
        }
        else
        {
            var _srcLength = array_length(arg0);
            var _dstLength = array_length(arg1);
            
            if (_dstLength < _srcLength)
                array_resize(arg1, _srcLength);
            
            var _i = 0;
            
            repeat (_srcLength)
            {
                arg1[_i] = __SnapMerge(arg0[_i], arg1[_i], arg2);
                _i++;
            }
            
            return arg1;
        }
    }
    else
    {
        return arg0;
    }
}
