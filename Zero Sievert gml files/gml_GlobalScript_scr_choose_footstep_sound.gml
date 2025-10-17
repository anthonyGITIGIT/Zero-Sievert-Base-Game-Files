function scr_choose_footstep_sound(arg0)
{
    var f_type = arg0;
    var sound_ = -1;
    
    if (instance_exists(obj_sound_controller))
    {
        var os = obj_sound_controller;
        var x1 = x div 16;
        var y1 = (y + 8) div 16;
        var sound_grass = choose(snd_walk_grass_1, snd_walk_grass_2, snd_walk_grass_3, snd_walk_grass_4);
        var sound_concrete = choose(snd_walk_concrete_1, snd_walk_concrete_2, snd_walk_concrete_3, snd_walk_concrete_4);
        var sound_mud = choose(snd_walk_mud_1, snd_walk_mud_2, snd_walk_mud_3, snd_walk_mud_4);
        var sound_dirt = choose(snd_walk_dirt_1, snd_walk_dirt_2, snd_walk_dirt_3, snd_walk_dirt_4);
        var sound_wood = choose(snd_walk_wood_1, snd_walk_wood_2, snd_walk_wood_3, snd_walk_wood_4);
        var sound_metal = choose(snd_walk_metal_1, snd_walk_metal_2, snd_walk_metal_3, snd_walk_metal_4);
        var sound_snow = choose(snd_walk_snow_1, snd_walk_snow_2, snd_walk_snow_3, snd_walk_snow_4);
        var sound_dog = choose(snd_walk_dog_1, snd_walk_dog_2, snd_walk_dog_3, snd_walk_dog_4, snd_walk_dog_5);
        var sound_big = choose(snd_walk_big_1, snd_walk_big_2, snd_walk_big_3, snd_walk_big_4);
        
        if (instance_exists(obj_map_generator))
        {
            var om = obj_map_generator;
            
            if (is_in_raid())
            {
                switch (f_type)
                {
                    case UnknownEnum.Value_0:
                        break;
                    
                    case UnknownEnum.Value_2:
                        sound_ = sound_dog;
                        break;
                    
                    case UnknownEnum.Value_4:
                        break;
                    
                    case UnknownEnum.Value_5:
                        sound_ = sound_big;
                        break;
                    
                    case UnknownEnum.Value_1:
                        if (y <= om.map_height)
                        {
                            if (om.area == UnknownEnum.Value_4)
                                sound_ = sound_mud;
                            else
                                sound_ = sound_grass;
                            
                            if (ds_grid_get(om.grid_floor2, x1, y1) == 0 || ds_grid_get(om.grid_floor2, x1, y1) == 4)
                                sound_ = sound_dirt;
                            
                            if (ds_grid_get(om.grid_floor2, x1, y1) == 1)
                                sound_ = sound_concrete;
                            
                            if (ds_grid_get(om.grid_floor2, x1, y1) == 5 || ds_grid_get(om.grid_floor2, x1, y1) == 5)
                                sound_ = sound_grass;
                            
                            if (ds_grid_get(om.grid_strada, x div 96, y div 96) == true)
                                sound_ = sound_concrete;
                            
                            if (ds_grid_get(om.grid_snow, x1, y1))
                                sound_ = sound_snow;
                        }
                        else
                        {
                            var get_cell = tilemap_get(om.layer_tileset_floor_indoor, x1, y1);
                            var celly = get_cell div 32;
                            var cellx = get_cell - (celly * 32);
                            var material = ds_grid_get(os.grid_footstep, cellx, celly);
                            
                            switch (material)
                            {
                                case UnknownEnum.Value_0:
                                    sound_ = sound_concrete;
                                    break;
                                
                                case UnknownEnum.Value_1:
                                    sound_ = sound_wood;
                                    break;
                                
                                case UnknownEnum.Value_2:
                                    sound_ = sound_metal;
                                    break;
                            }
                        }
                        
                        break;
                }
            }
        }
        
        if (is_in_hub())
        {
            if (y < 1195)
            {
                var get_tile_id = layer_tilemap_get_id("Floor");
                var get_cell = tilemap_get(get_tile_id, x1, y1);
                var celly = get_cell div 32;
                var cellx = get_cell - (celly * 32);
                var material = ds_grid_get(os.grid_footstep, cellx, celly);
                
                switch (material)
                {
                    case UnknownEnum.Value_0:
                        sound_ = sound_concrete;
                        break;
                    
                    case UnknownEnum.Value_1:
                        sound_ = sound_wood;
                        break;
                    
                    case UnknownEnum.Value_2:
                        sound_ = sound_metal;
                        break;
                }
            }
            else
            {
                sound_ = sound_dirt;
            }
        }
        
        if (room == test_room)
        {
            switch (f_type)
            {
                case UnknownEnum.Value_0:
                    break;
                
                case UnknownEnum.Value_2:
                    sound_ = sound_dog;
                    break;
                
                case UnknownEnum.Value_4:
                    break;
                
                case UnknownEnum.Value_1:
                    sound_ = sound_grass;
                    break;
                
                case UnknownEnum.Value_5:
                    sound_ = sound_big;
                    break;
            }
        }
        
        if (sound_ != -1)
        {
            audio_play_sound_on(emitter_walk, sound_, false, 5);
            
            if (object_is_player(object_index))
            {
                var _sound_equipment = choose(snd_equipment_rattle_1, snd_equipment_rattle_2, snd_equipment_rattle_3, snd_equipment_rattle_4);
                audio_play_sound(_sound_equipment, 11, false);
                
                if (scr_chance(35))
                {
                    var _sound_metal = choose(snd_equipment_metal_clip_1, snd_equipment_metal_clip_2, snd_equipment_metal_clip_3, snd_equipment_metal_clip_4);
                    audio_play_sound(_sound_metal, 11, false);
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_4 = 4,
    Value_5
}
