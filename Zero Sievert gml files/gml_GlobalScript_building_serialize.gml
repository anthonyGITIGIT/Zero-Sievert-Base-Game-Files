function building_serialize(arg0, arg1, arg2)
{
    if (!instance_exists(obj_editor))
    {
        __building_error("Cannot call building_serialize() outside of the editor");
        exit;
    }
    
    var _editor = obj_editor;
    var _grid_w16 = room_width div 16;
    var _grid_h16 = room_height div 16;
    var _grid_w32 = room_width div 32;
    var _grid_h32 = room_height div 32;
    var _grid_w96 = room_width div 96;
    var _grid_h96 = room_height div 96;
    var _buffer = buffer_create(1024, buffer_grow, 1);
    buffer_write(_buffer, buffer_string, "ZS");
    buffer_write(_buffer, buffer_u64, 1);
    buffer_write(_buffer, buffer_string, arg0);
    buffer_write(_buffer, buffer_string, json_stringify(arg2));
    var _chunk_tell = buffer_tell(_buffer);
    buffer_write(_buffer, buffer_u16, 0);
    var _chunk_count = 0;
    
    if (arg1 == UnknownEnum.Value_0)
    {
        var _objects_serialize_array = [obj_extraction_point, obj_npc_parent, obj_enemy_spawner_parent, obj_chest_general, obj_spawner_chest_parent, obj_solid, obj_solid_can_see, obj_light, obj_indoor_specific_parent, obj_spawner_ghoul, obj_spawner_ghoul_quest_swamp, obj_quest_object_parent, obj_quest_approach_parent, obj_door_parent, obj_solid_crismon_base_ingresso, obj_anomaly_electric_generator, obj_anomaly_fire_generator_big, obj_anomaly_fire_generator_medium, obj_anomaly_fire_generator_small, obj_anomaly_gas_generator_big, obj_anomaly_gas_generator_medium, obj_anomaly_gas_generator_small, obj_grenade_mine_pmn, obj_deserialize_parent, obj_spawner_extraction, obj_spawner_player_100, obj_spawner_extraction_quest_bridge_to_zakov, obj_interact_parent, obj_sewer_unknown_spawner, obj_prologue];
        _chunk_count++;
        buffer_write(_buffer, buffer_string, "inst");
        var _chunk_byte_size_tell = buffer_tell(_buffer);
        buffer_write(_buffer, buffer_u16, 0);
        var _instance_count_tell = buffer_tell(_buffer);
        buffer_write(_buffer, buffer_u16, 0);
        var _instance_count = 0;
        var _i = 0;
        
        repeat (array_length(_objects_serialize_array))
        {
            var _object = _objects_serialize_array[_i];
            
            with (_object)
            {
                if (_object == obj_npc_parent)
                {
                    if (!variable_struct_exists(global.npc_data, npc_id))
                        continue;
                }
                else if (_object == obj_chest_general)
                {
                    if (!variable_struct_exists(global.chest_data, tipo))
                        continue;
                }
                else if (_object == obj_solid)
                {
                    if (object_index != obj_solid)
                        continue;
                }
                
                buffer_write(_buffer, buffer_f64, x);
                buffer_write(_buffer, buffer_f64, y);
                buffer_write(_buffer, buffer_string, object_get_name(object_index));
                _instance_count++;
            }
            
            _i++;
        }
        
        buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
        buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count);
        buffer_write(_buffer, buffer_u64, 0);
        
        if (instance_exists(obj_indoor))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "tele");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            _instance_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, instance_number(obj_indoor));
            _instance_count = 0;
            
            with (obj_indoor)
            {
                buffer_write(_buffer, buffer_f64, x);
                buffer_write(_buffer, buffer_f64, y);
                _instance_count++;
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("solid_layer"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "inst");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            _instance_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _solid_layer = layer_tilemap_get_id("solid_layer");
            _instance_count = 0;
            
            for (var _x = 0; _x < _grid_w16; _x++)
            {
                for (var _y = 0; _y < _grid_h16; _y++)
                {
                    var _cell = tilemap_get(_solid_layer, _x, _y);
                    
                    if (_cell > 0)
                    {
                        var _object = (_cell == 2) ? obj_solid_can_see : obj_solid;
                        buffer_write(_buffer, buffer_f64, _x * 16);
                        buffer_write(_buffer, buffer_f64, _y * 16);
                        buffer_write(_buffer, buffer_string, object_get_name(_object));
                        _instance_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("fence_serialize"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "fence grid");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("fence_serialize");
            
            for (var _x = 0; _x < _grid_w16; _x++)
            {
                for (var _y = 0; _y < _grid_h16; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        var _id = undefined;
                        
                        switch (_cell)
                        {
                            case 1:
                                _id = 1;
                                break;
                            
                            case 2:
                                _id = 2;
                                break;
                            
                            case 3:
                                _id = 3;
                                break;
                            
                            default:
                                __building_error("Unhandled cell type for \"fence_serialize\" layer ", _cell);
                                break;
                        }
                        
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u8, _id);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (instance_exists(obj_editor_fence_parent))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "fence grid");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count = 0;
            
            with (obj_editor_fence_parent)
            {
                var _x = x div 16;
                var _y = y div 16;
                var _id = undefined;
                
                switch (fence)
                {
                    case s_tileset_fence_wood_big:
                        _id = 1;
                        break;
                    
                    case s_tileset_fence_concrete1:
                        _id = 2;
                        break;
                    
                    case s_tileset_fence_military:
                        _id = 3;
                        break;
                }
                
                buffer_write(_buffer, buffer_u16, _x);
                buffer_write(_buffer, buffer_u16, _y);
                buffer_write(_buffer, buffer_u8, _id);
                _cell_count++;
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (instance_exists(obj_decor_parent))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "decor");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            _instance_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            _instance_count = 0;
            
            with (obj_decor_parent)
            {
                if (object_index != obj_solid)
                {
                    var _index = array_find_index(_editor.decor_obj, object_index);
                    
                    if (_index != undefined)
                    {
                        buffer_write(_buffer, buffer_f64, x);
                        buffer_write(_buffer, buffer_f64, y);
                        buffer_write(_buffer, buffer_u16, _index);
                        _instance_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("floor2"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "grid");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_string, "floor2");
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("floor2");
            
            for (var _x = 0; _x < _grid_w16; _x++)
            {
                for (var _y = 0; _y < _grid_h16; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        var _id = undefined;
                        
                        switch (_cell)
                        {
                            case 1:
                                _id = 0;
                                break;
                            
                            case 2:
                                _id = 1;
                                break;
                            
                            case 3:
                                _id = 6;
                                break;
                            
                            case 5:
                                _id = 8;
                                break;
                            
                            case 6:
                                _id = 10;
                                break;
                            
                            default:
                                __building_error("Unhandled cell type for \"floor2\" layer ", _cell);
                                break;
                        }
                        
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u16, _id);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("layer_prevent_spawn"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "grid");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_string, "prevent_spawn");
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("layer_prevent_spawn");
            
            for (var _x = 0; _x < _grid_w16; _x++)
            {
                for (var _y = 0; _y < _grid_h16; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u16, true);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("grid_map"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "grid_map");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("grid_map");
            
            for (var _x = 0; _x < _grid_w16; _x++)
            {
                for (var _y = 0; _y < _grid_h16; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u32, _cell);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("road"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "grid + tiles");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_string, "strada");
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_u16, 1);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("road");
            
            for (var _x = 0; _x < _grid_w96; _x++)
            {
                for (var _y = 0; _y < _grid_h96; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u32, _cell);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("water"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "water");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("water");
            
            for (var _x = 0; _x < _grid_w16; _x++)
            {
                for (var _y = 0; _y < _grid_h16; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u32, _cell);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("parking"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "grid + tiles");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_string, "parking");
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_u16, 1);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("parking");
            
            for (var _x = 0; _x < _grid_w96; _x++)
            {
                for (var _y = 0; _y < _grid_h96; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u32, _cell);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        if (layer_exists("railroad"))
        {
            _chunk_count++;
            buffer_write(_buffer, buffer_string, "grid + tiles");
            _chunk_byte_size_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_string, "railroad");
            var _cell_count_tell = buffer_tell(_buffer);
            buffer_write(_buffer, buffer_u16, 0);
            buffer_write(_buffer, buffer_u16, 2);
            var _cell_count = 0;
            var _tilemap = layer_tilemap_get_id("railroad");
            
            for (var _x = 0; _x < _grid_w96; _x++)
            {
                for (var _y = 0; _y < _grid_h96; _y++)
                {
                    var _cell = tilemap_get(_tilemap, _x, _y);
                    
                    if (_cell > 0)
                    {
                        buffer_write(_buffer, buffer_u16, _x);
                        buffer_write(_buffer, buffer_u16, _y);
                        buffer_write(_buffer, buffer_u32, _cell);
                        _cell_count++;
                    }
                }
            }
            
            buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
            buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
            buffer_write(_buffer, buffer_u64, 0);
        }
        
        var _tile_layer_serialize_array = [
        {
            layer: "indoor_floor",
            scale: 1
        }, 
        {
            layer: "indoor_wall_below",
            scale: 1
        }, 
        {
            layer: "indoor_wall_above",
            scale: 1
        }, 
        {
            layer: "indoor_cartelli",
            scale: 1
        }, 
        {
            layer: "building_test",
            scale: 1
        }, 
        {
            layer: "floor_detail",
            scale: 1
        }];
        _i = 0;
        
        repeat (array_length(_tile_layer_serialize_array))
        {
            var _layer_data = _tile_layer_serialize_array[_i];
            var _layer_name = _layer_data.layer;
            var _layer_scale = _layer_data.scale;
            
            if (!layer_exists(_layer_name))
            {
                _i++;
            }
            else
            {
                _chunk_count++;
                buffer_write(_buffer, buffer_string, "tiles");
                _chunk_byte_size_tell = buffer_tell(_buffer);
                buffer_write(_buffer, buffer_u16, 0);
                buffer_write(_buffer, buffer_string, _layer_name);
                buffer_write(_buffer, buffer_u8, _layer_scale);
                var _cell_count_tell = buffer_tell(_buffer);
                buffer_write(_buffer, buffer_u16, 0);
                var _layer_width = (_layer_scale == 6) ? _grid_w96 : _grid_w16;
                var _layer_height = (_layer_scale == 6) ? _grid_h96 : _grid_h16;
                var _cell_count = 0;
                var _tilemap = layer_tilemap_get_id(_layer_name);
                
                for (var _x = 0; _x < _layer_width; _x++)
                {
                    for (var _y = 0; _y < _layer_height; _y++)
                    {
                        var _cell = tilemap_get(_tilemap, _x, _y);
                        
                        if (_cell > 0)
                        {
                            buffer_write(_buffer, buffer_u16, _x);
                            buffer_write(_buffer, buffer_u16, _y);
                            buffer_write(_buffer, buffer_u32, _cell);
                            _cell_count++;
                        }
                    }
                }
                
                buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
                buffer_poke(_buffer, _cell_count_tell, buffer_u16, _cell_count);
                buffer_write(_buffer, buffer_u64, 0);
                _i++;
            }
        }
    }
    else if (arg1 == UnknownEnum.Value_1)
    {
        var _objects_serialize_array = [obj_decor_parent, obj_solid, obj_npc_parent];
        _chunk_count++;
        buffer_write(_buffer, buffer_string, "inst");
        var _chunk_byte_size_tell = buffer_tell(_buffer);
        buffer_write(_buffer, buffer_u16, 0);
        var _instance_count_tell = buffer_tell(_buffer);
        buffer_write(_buffer, buffer_u16, 0);
        var _instance_count = 0;
        var _i = 0;
        
        repeat (array_length(_objects_serialize_array))
        {
            var _object = _objects_serialize_array[_i];
            
            with (_object)
            {
                if (_object == obj_decor_parent)
                {
                    if (!array_contains(_editor.decor_sprite, sprite_index))
                        continue;
                }
                else if (_object == obj_npc_parent)
                {
                    if (!variable_struct_exists(global.npc_data, npc_id))
                        continue;
                }
                
                buffer_write(_buffer, buffer_f64, x);
                buffer_write(_buffer, buffer_f64, y);
                buffer_write(_buffer, buffer_string, object_get_name(object_index));
                _instance_count++;
            }
            
            _i++;
        }
        
        buffer_poke(_buffer, _chunk_byte_size_tell, buffer_u16, buffer_tell(_buffer));
        buffer_poke(_buffer, _instance_count_tell, buffer_u16, _instance_count);
        buffer_write(_buffer, buffer_u64, 0);
    }
    
    buffer_poke(_buffer, _chunk_tell, buffer_u16, _chunk_count);
    buffer_resize(_buffer, buffer_tell(_buffer));
    audio_play_sound(snd_accendino_1, 20, false);
    return _buffer;
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
