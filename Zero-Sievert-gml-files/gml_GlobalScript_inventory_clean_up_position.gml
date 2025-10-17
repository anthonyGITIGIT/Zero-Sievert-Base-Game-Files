function inventory_clean_up_position(arg0, arg1, arg2, arg3)
{
    static _result = {};
    
    var _nearest_distance = 12;
    var _nearest_x = arg0;
    var _nearest_y = arg1;
    var _i = 0;
    
    repeat (array_length(global.__legacy_inventory_hotspots))
    {
        var _hotspot_data = global.__legacy_inventory_hotspots[_i];
        var _hotspot_x = _hotspot_data.x;
        var _hotspot_y = _hotspot_data.y;
        var _hotspot_w = _hotspot_data.width;
        var _hotspot_h = _hotspot_data.height;
        
        if (rectangle_in_rectangle(arg0, arg1, arg0 + arg2, arg1 + arg3, _hotspot_x, _hotspot_y, _hotspot_x + _hotspot_w, _hotspot_y + _hotspot_h))
        {
            switch (_hotspot_data.type)
            {
                case "grid":
                    var _found = false;
                    var _y = _hotspot_y;
                    
                    repeat (_hotspot_h div 16)
                    {
                        var _x = _hotspot_x;
                        
                        repeat (_hotspot_w div 16)
                        {
                            var _distance = point_distance(arg0, arg1, _x, _y);
                            
                            if (_distance < _nearest_distance)
                            {
                                _nearest_distance = _distance;
                                _nearest_x = _x;
                                _nearest_y = _y;
                                _found = true;
                                break;
                            }
                            
                            _x += 16;
                        }
                        
                        if (_found)
                            break;
                        
                        _y += 16;
                    }
                    
                    break;
                
                case "slot":
                    var _distance = point_distance(arg0, arg1, _hotspot_x, _hotspot_y);
                    
                    if (_distance < _nearest_distance)
                    {
                        _nearest_distance = _distance;
                        _nearest_x = _hotspot_x + (0.5 * (_hotspot_w - arg2));
                        _nearest_y = _hotspot_y + (0.5 * (_hotspot_h - arg3));
                    }
                    
                    break;
            }
        }
        
        _i++;
    }
    
    _result.x = _nearest_x;
    _result.y = _nearest_y;
    return _result;
}
