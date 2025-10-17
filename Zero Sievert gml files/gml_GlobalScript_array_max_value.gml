function array_max_value(arg0)
{
    var _running_best = -infinity;
    var _running_best_id = undefined;
    var _array_length = array_length(arg0);
    
    for (var i = 0; i < _array_length; i++)
    {
        if (arg0[i] > _running_best)
        {
            _running_best = arg0[i];
            _running_best_id = i;
        }
    }
    
    return _running_best;
}
