function loot_repair_get_armor_class(arg0)
{
    var _arr = item_repair_get_armor_class(arg0.item);
    var _text = "";
    
    for (var i = 0; i < array_length(_arr); i++)
    {
        if (i != 0)
            _text += ", ";
        
        _text += string(_arr[i]);
    }
    
    return _text;
}
