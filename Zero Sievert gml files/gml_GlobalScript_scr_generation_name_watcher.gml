function scr_generation_name_watcher()
{
    var _max_digits = 6;
    var _text_number = "";
    
    for (var i = 0; i < _max_digits; i++)
    {
        var _random_digits = irandom(9);
        
        if (i == 0)
            _random_digits = 0;
        
        if (i == 1)
            _random_digits = choose(0, 1, 1, 2);
        
        _text_number += string(_random_digits);
    }
    
    return _text_number;
}
