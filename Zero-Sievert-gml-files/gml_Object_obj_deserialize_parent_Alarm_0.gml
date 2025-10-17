if (room == room1)
{
    if (dese_on_position == true)
    {
        var _room = array_room[irandom(array_length(array_room) - 1)];
        building_deserialize(_room, x div 16, y div 16);
        instance_destroy();
    }
    else if (instance_exists(obj_map_generator))
    {
        var o = obj_map_generator;
        var _grid_indoor = o.grid_indoor;
        var _indoor_w = indoor_w;
        var _indoor_h = indoor_h;
        var off = 17;
        var _y = o.grid_tile_h + off;
        var placed = false;
        
        repeat ((1 + o.g_indoor_h) - _y - _indoor_h - off)
        {
            var _x = 17;
            
            repeat ((1 + o.g_indoor_w) - _x - _indoor_w - off)
            {
                if (ds_grid_value_exists(_grid_indoor, _x, _y, (_x + _indoor_w) - 1, (_y + _indoor_h) - 1, true))
                {
                    _x++;
                }
                else
                {
                    placed = true;
                    var choose_indoor = array_room[irandom(array_length(array_room) - 1)];
                    var tele_x = x;
                    var tele_y = y;
                    building_deserialize_indoor(choose_indoor, _x, _y, off, lighting_type, _indoor_w, _indoor_h, tele_x, tele_y);
                    break;
                }
            }
            
            if (placed)
                break;
            
            _y++;
        }
        
        if (!placed)
            trace("Warning! Failed to place building");
    }
    else
    {
        trace("Warning! obj_map_generator doesn't exists");
    }
}
