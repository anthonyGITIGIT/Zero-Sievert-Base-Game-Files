function SnapDeepCopy(arg0)
{
    return __SnapDeepCopyInner(arg0, self, self);
}

function __SnapDeepCopyInner(arg0, arg1, arg2)
{
    var _copy = arg0;
    
    if (is_method(arg0))
    {
        var _self = method_get_self(arg0);
        
        if (_self == arg1)
            arg0 = method(arg2, method_get_index(arg0));
        else if (_self != undefined)
            trace("SnapDeepCopy(): Warning! Deep copy found a method reference that could not be appropriately handled");
    }
    else if (is_struct(arg0))
    {
        var _namesArray = variable_struct_get_names(arg0);
        _copy = {};
        var _i = 0;
        
        repeat (array_length(_namesArray))
        {
            var _name = _namesArray[_i];
            variable_struct_set(_copy, _name, __SnapDeepCopyInner(variable_struct_get(arg0, _name), arg0, _copy));
            _i++;
        }
    }
    else if (is_array(arg0))
    {
        var _count = array_length(arg0);
        _copy = array_create(_count);
        var _i = 0;
        
        repeat (_count)
        {
            _copy[_i] = __SnapDeepCopyInner(arg0[_i], arg1, arg2);
            _i++;
        }
    }
    
    return _copy;
}
