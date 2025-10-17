function array_push_unique(arg0, arg1)
{
    var _i = 0;
    
    repeat (array_length(arg0))
    {
        if (arg0[_i] == arg1)
            exit;
        
        _i++;
    }
    
    array_push(arg0, arg1);
}
