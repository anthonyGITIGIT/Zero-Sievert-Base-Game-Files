if (is_in_raid())
{
    if (instance_exists(obj_map_generator))
    {
        if (obj_map_generator.state == UnknownEnum.Value_21)
        {
            unstuck_counter_timer++;
            
            if (unstuck_counter_timer >= unstuck_counter_timer_max)
            {
                if (place_meeting(x, y, obj_solid))
                {
                    unstuck_counter++;
                    
                    if (unstuck_counter >= unstuck_counter_max)
                    {
                        unstuck_counter = 0;
                        unstuck_counter_timer = 0;
                        
                        if (instance_exists(obj_controller))
                        {
                            var o = obj_controller;
                            var _x = x div 16;
                            var _y = y div 16;
                            var _newx = 0;
                            var _newy = 0;
                            
                            for (var i = 0; i < 5; i++)
                            {
                                var xx = (_x * 16) + 8;
                                var yy = (_y * 16) + 8;
                                
                                if (ds_grid_get(o.grid_motion, _x + i, _y) == 0)
                                {
                                    xx = ((_x + i) * 16) + 8;
                                    yy = (_y * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                                
                                if (ds_grid_get(o.grid_motion, _x - i, _y) == 0)
                                {
                                    xx = ((_x - i) * 16) + 8;
                                    yy = (_y * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                                
                                if (ds_grid_get(o.grid_motion, _x, _y - i) == 0)
                                {
                                    xx = (_x * 16) + 8;
                                    yy = ((_y - i) * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                                
                                if (ds_grid_get(o.grid_motion, _x, _y + i) == 0)
                                {
                                    xx = (_x * 16) + 8;
                                    yy = ((_y + i) * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                                
                                if (ds_grid_get(o.grid_motion, _x + i, _y - i) == 0)
                                {
                                    xx = ((_x + i) * 16) + 8;
                                    yy = ((_y - i) * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                                
                                if (ds_grid_get(o.grid_motion, _x - i, _y - i) == 0)
                                {
                                    xx = ((_x - i) * 16) + 8;
                                    yy = ((_y - i) * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                                
                                if (ds_grid_get(o.grid_motion, _x - i, _y + i) == 0)
                                {
                                    xx = ((_x - i) * 16) + 8;
                                    yy = ((_y + i) * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                                
                                if (ds_grid_get(o.grid_motion, _x + i, _y + i) == 0)
                                {
                                    xx = ((_x + i) * 16) + 8;
                                    yy = ((_y + i) * 16) + 8;
                                    
                                    if (!place_meeting(xx, yy, obj_solid))
                                    {
                                        _newx = xx;
                                        _newy = yy;
                                        break;
                                    }
                                }
                            }
                            
                            if (_newx != 0 && _newy != 0)
                            {
                                x = _newx;
                                y = _newy;
                            }
                        }
                    }
                }
                else
                {
                    unstuck_counter = 0;
                    unstuck_counter_timer = 0;
                }
            }
        }
    }
}

event_inherited();

enum UnknownEnum
{
    Value_21 = 21
}
