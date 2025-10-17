if (y >= stop_y)
{
    if (rimbalzo_max > 0 && rimbalzo < rimbalzo_max)
    {
        vspeed = -1.5;
        rimbalzo++;
        
        if (audio_can == true)
        {
            if (audio_done == false)
            {
                audio_done = true;
                
                if (is_in_raid())
                {
                    var sound_ = undefined;
                    var sound_grass = choose(snd_bullet_fall_grass_1, snd_bullet_fall_grass_2, snd_bullet_fall_grass_3);
                    var sound_concrete = choose(snd_bullet_fall_concrete_1, snd_bullet_fall_concrete_2, snd_bullet_fall_concrete_3);
                    var sound_wood = choose(snd_bullet_fall_wood_1, snd_bullet_fall_wood_2, snd_bullet_fall_wood_3);
                    var sound_metal = choose(snd_bullet_fall_metal_1, snd_bullet_fall_metal_2, snd_bullet_fall_metal_3);
                    var om = obj_map_generator;
                    var os = obj_sound_controller;
                    var x1 = x div 16;
                    var y1 = (y - 4) div 16;
                    
                    if (y <= om.map_height)
                    {
                        sound_ = sound_grass;
                        
                        if (ds_grid_get(om.grid_floor2, x1, y1) == 1)
                            sound_ = sound_concrete;
                        
                        if (ds_grid_get(om.grid_floor2, x1, y1) == 5 || ds_grid_get(om.grid_floor2, x1, y1) == 5)
                            sound_ = sound_grass;
                        
                        if (ds_grid_get(om.grid_strada, x div 96, y div 96) == true)
                            sound_ = sound_concrete;
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
                    
                    if (sound_ != undefined)
                        audio_play_sound(sound_, 12, false);
                }
            }
        }
    }
    else
    {
        vspeed = 0;
        hspeed = 0;
        depth = -y + 15;
    }
}
else
{
    depth = -y;
    vspeed += grav;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
