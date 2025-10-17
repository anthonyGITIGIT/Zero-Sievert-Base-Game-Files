var m = obj_map_generator;

if (decor_id == UnknownEnum.Value_548)
    var a = 0;

var eccezione = false;

if (object_index == obj_train || object_index == obj_radio_tower || object_index == obj_tree_special || object_index == obj_train_hub)
    eccezione = true;

if (is_in_hub())
    need_to_check = false;

var _starting_decor_id = decor_id;

if (eccezione == false)
{
    if (object_index != obj_solid)
    {
        if (need_to_check == true)
        {
            if (is_in_raid())
            {
                var gx = x div 16;
                var gy = y div 16;
                var destroy = false;
                
                if (decor_id == UnknownEnum.Value_1 || decor_id == UnknownEnum.Value_2)
                {
                    x += irandom_range(-8, 8);
                    y += irandom_range(-8, 8);
                }
                
                var radx = x div 8;
                var rady = y div 8;
                
                if (ds_grid_get(m.grid_radiation, radx, rady) > 100)
                {
                    if (decor_id == UnknownEnum.Value_1)
                        decor_id = UnknownEnum.Value_2;
                }
                
                if (decor_id == UnknownEnum.Value_1 || decor_id == UnknownEnum.Value_2 || decor_id == UnknownEnum.Value_3)
                {
                    if (ds_grid_get(m.grid_snow, gx, gy) == true)
                    {
                        if (decor_id == UnknownEnum.Value_1)
                            decor_id = UnknownEnum.Value_631;
                        
                        if (decor_id == UnknownEnum.Value_2)
                            decor_id = UnknownEnum.Value_632;
                        
                        if (decor_id == UnknownEnum.Value_3)
                            decor_id = UnknownEnum.Value_633;
                    }
                }
                
                if (decor_id == UnknownEnum.Value_4)
                {
                    if (instance_exists(obj_anomaly_gas))
                    {
                        if (distance_to_object(obj_anomaly_gas) < 32)
                            destroy = true;
                    }
                }
                
                if (ds_grid_get(obj_map_generator.grid_building, gx, gy) == -1)
                    destroy = true;
                
                var fx = x div 96;
                var fy = y div 96;
                
                if (ds_grid_get(obj_map_generator.grid_train, fx, fy) == true)
                    destroy = true;
                
                if (instance_exists(obj_train_stop))
                {
                    if (point_distance(x, y, obj_train_stop.x, obj_train_stop.y) < 128)
                        destroy = true;
                }
                
                if (instance_exists(obj_indoor))
                {
                    var indoor_near = instance_nearest(x, y, obj_indoor);
                    
                    if (distance_to_object(indoor_near) < 32)
                        destroy = true;
                }
                
                if (instance_exists(obj_prevent_spawn_48))
                {
                    var prevent_near = instance_nearest(x, y, obj_prevent_spawn_48);
                    
                    if (distance_to_object(prevent_near) < 64)
                        destroy = true;
                }
                
                if (ds_grid_get(obj_map_generator.grid_water, gx, gy) == -1)
                    destroy = true;
                
                if (decor_id == UnknownEnum.Value_1 || decor_id == UnknownEnum.Value_2 || decor_id == UnknownEnum.Value_4 || decor_id == UnknownEnum.Value_8 || decor_id == UnknownEnum.Value_8)
                {
                    if (ds_grid_get(m.grid_floor2, gx, gy) == 1)
                    {
                        if (m.area == UnknownEnum.Value_6)
                        {
                            if (scr_chance(30))
                                decor_id = UnknownEnum.Value_17;
                            else
                                destroy = true;
                        }
                        else
                        {
                            destroy = true;
                        }
                    }
                }
                
                if (m.area == UnknownEnum.Value_6)
                {
                    if (gx >= 50 && gx <= 250 && gy >= 48 && gy <= 197)
                    {
                        if (scr_chance(20))
                            decor_id = UnknownEnum.Value_339;
                    }
                    
                    if (gx >= 81 && gx <= 232 && gy >= 59 && gy <= 129)
                    {
                        if (scr_chance(20))
                            destroy = true;
                    }
                }
                
                if (place_meeting(x, y, obj_chest_general))
                    destroy = true;
                
                if (decor_id == UnknownEnum.Value_290 || decor_id == UnknownEnum.Value_291)
                {
                    if (ds_grid_get(m.grid_floor2, gx, gy) == 1)
                        destroy = true;
                }
                
                if (ds_grid_get(m.grid_fence, gx, gy) != -1)
                    destroy = true;
                
                if (instance_exists(obj_cristallo_viola))
                {
                    var _x = obj_cristallo_viola.x;
                    var _y = obj_cristallo_viola.y;
                    
                    if (point_distance(x, y, _x, _y) < 264)
                        destroy = true;
                }
                
                var rx = x div 96;
                var ry = y div 96;
                
                if (ds_grid_get(m.grid_strada, rx, ry) == true)
                {
                    if (m.area != UnknownEnum.Value_8)
                    {
                        if (scr_chance(80))
                        {
                            destroy = true;
                        }
                        else
                        {
                            decor_id = choose(UnknownEnum.Value_9, UnknownEnum.Value_10, UnknownEnum.Value_17);
                            
                            if (scr_chance(35))
                                decor_id = UnknownEnum.Value_11;
                            
                            if (scr_chance(15))
                                decor_id = UnknownEnum.Value_16;
                        }
                    }
                    else if (scr_chance(65))
                    {
                        destroy = true;
                    }
                    else
                    {
                        decor_id = UnknownEnum.Value_17;
                    }
                    
                    if (m.area == UnknownEnum.Value_1)
                    {
                        if (distance_to_object(obj_house_dark) < 128 || distance_to_object(obj_house_dark3) < 128 || distance_to_object(obj_house_dark_police) < 128)
                            destroy = true;
                    }
                }
                
                if (ds_grid_get(m.grid_floor2, gx, gy) == 3)
                    destroy = true;
                
                sprite_index = m.decor_sprite[decor_id];
                
                if (place_meeting(x, y, obj_solid))
                {
                    if (object_get_parent(object_index) == obj_solid)
                        destroy = true;
                }
                
                if (destroy == false)
                {
                    if (_starting_decor_id != decor_id)
                    {
                        destroy = true;
                        var snapx = x;
                        var snapy = y;
                        var decor_ = instance_create_depth(snapx, snapy, -y, m.decor_obj[decor_id]);
                        decor_.decor_id = decor_id;
                        decor_.need_to_check = false;
                    }
                    else
                    {
                        need_to_check = false;
                    }
                }
                
                if (destroy == true)
                    instance_destroy();
            }
        }
        
        if (need_to_check == false)
        {
            if (decor_id == UnknownEnum.Value_548)
                var a = 0;
            
            if (!is_in_hub())
                sprite_index = obj_controller.decor_sprite[decor_id];
            
            image_index = irandom(sprite_get_number(sprite_index));
            
            if (obj_controller.decor_specchio[decor_id] == true)
            {
                var get_sprite = obj_controller.decor_sprite[decor_id];
                var sx = sprite_get_xoffset(get_sprite);
                var sw = sprite_get_width(get_sprite);
                var ss = choose(1, -1);
                var s1 = 0;
                
                if (ss == -1)
                    s1 = sw - sx - sx;
                
                x += s1;
                image_xscale = ss;
            }
            else
            {
                image_xscale = 1;
            }
            
            depth = (-y - sprite_get_height(sprite_index)) + sprite_get_yoffset(sprite_index);
            my_height = obj_controller.decor_height[decor_id];
            var radx = x div 8;
            var rady = y div 8;
            
            if (is_in_raid())
            {
                if (m.decor_radiation[decor_id] > 0)
                {
                    var sprite_w = sprite_get_width(sprite_index);
                    var sprite_h = sprite_get_height(sprite_index);
                    var centerx = sprite_w div 16;
                    var centery = sprite_h div 16;
                    var offx = sprite_get_xoffset(sprite_index);
                    var offy = sprite_get_yoffset(sprite_index);
                    var number_of_zone = (m.decor_radiation[decor_id] div 10) + 1;
                    number_of_zone = clamp(number_of_zone, 1, 10);
                    
                    for (var i = 0; i < number_of_zone; i++)
                    {
                        var off = 8 * (number_of_zone - i);
                        var starty = (rady + ((sprite_h - offy) div 8)) - (centery / 2) - 1;
                        var startx = (radx + (((sprite_w / 2) - offx) div 8)) - (centerx / 2);
                        var finx;
                        
                        if (offx == 0)
                        {
                            startx = (x - off) div 8;
                            finx = (x + sprite_w + off) div 8;
                        }
                        else
                        {
                            startx = (x - (sprite_w / 2) - off) div 8;
                            finx = (x + (sprite_w / 2) + off) div 8;
                        }
                        
                        var finy = (((y + sprite_h) - offy) + off) div 8;
                        starty = (y - offy - off) div 8;
                        var radiation_ = m.decor_radiation[decor_id] / number_of_zone;
                        ds_grid_add_region(m.grid_radiation, startx, starty, finx, finy, radiation_);
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_8 = 8,
    Value_9,
    Value_10,
    Value_11,
    Value_16 = 16,
    Value_17,
    Value_290 = 290,
    Value_291,
    Value_339 = 339,
    Value_548 = 548,
    Value_631 = 631,
    Value_632,
    Value_633
}
