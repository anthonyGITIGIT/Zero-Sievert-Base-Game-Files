function item_overlay_get_color(arg0)
{
    var _struct = global.overlay_item;
    var _min, _max, _color;
    
    switch (arg0)
    {
        case "weight":
            _min = _struct.weight_min;
            _max = _struct.weight_max;
            _color = [0, 1, 2, 3, 4];
            _value = item_get_weight(__lootStruct.item) * __lootStruct.quantity;
            break;
        
        case "value":
            _min = _struct.money_min;
            _max = _struct.money_max;
            _color = [4, 3, 2, 1, 0];
            _value = item_get_value(__lootStruct.item) * __lootStruct.quantity;
            break;
    }
    
    var _value = clamp(_value, _min, _max);
    var _div = _value / _max;
    var _step = (_max - _min) / array_length(global.overlay_item.color_overlay);
    var _col = 16777215;
    var _a = _min;
    
    if (_value >= 0)
        _col = merge_color(global.overlay_item.color_overlay[_color[0]], global.overlay_item.color_overlay[_color[1]], _value / (_a + _step));
    
    if (_value >= (_a + _step))
        _col = merge_color(global.overlay_item.color_overlay[_color[1]], global.overlay_item.color_overlay[_color[2]], (_value - _step) / (_a + (_step * 2)));
    
    if (_value >= (_a + (_step * 2)))
        _col = merge_color(global.overlay_item.color_overlay[_color[2]], global.overlay_item.color_overlay[_color[3]], (_value - (_step * 2)) / (_a + (_step * 3)));
    
    if (_value >= (_a + (_step * 3)))
        _col = merge_color(global.overlay_item.color_overlay[_color[3]], global.overlay_item.color_overlay[_color[4]], (_value - (_step * 3)) / (_a + (_step * 4)));
    
    if (_value >= (_a + (_step * 4)))
        _col = global.overlay_item.color_overlay[_color[4]];
    
    return _col;
}
