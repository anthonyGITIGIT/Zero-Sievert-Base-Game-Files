function number_to_roman(arg0)
{
    if (arg0 == 0)
        return "0";
    
    var _roman_numerals = ["C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    var _values = [100, 90, 50, 40, 10, 9, 5, 4, 1];
    var _result = "";
    
    for (var _i = 0; arg0 > 0; _i++)
    {
        while (arg0 >= _values[_i])
        {
            _result += _roman_numerals[_i];
            arg0 -= _values[_i];
        }
    }
    
    return _result;
}
