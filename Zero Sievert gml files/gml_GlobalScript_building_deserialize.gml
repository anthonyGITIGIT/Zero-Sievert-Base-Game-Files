function building_deserialize(arg0, arg1, arg2, arg3 = undefined, arg4 = undefined)
{
    var _building_name;
    
    if (is_string(arg0))
    {
        _building_name = arg0;
    }
    else
    {
        if (!room_exists(arg0))
            __building_error("Room ", arg0, " doesn't exist");
        
        _building_name = room_get_name(arg0);
    }
    
    var _room_x = 16 * arg1;
    var _room_y = 16 * arg2;
    var _grid_x96 = arg1 div 6;
    var _grid_y96 = arg2 div 6;
    var _buffer = variable_struct_get(global.building_buffer_dict, _building_name);
    
    if (_buffer == undefined)
        __building_error("Couldn't find a buffer for building \"", _building_name, "\"");
    
    buffer_seek(_buffer, buffer_seek_start, 0);
    var _zs_header = buffer_read(_buffer, buffer_string);
    
    if (_zs_header != "ZS")
    {
        __building_error("Building header corrupted");
        exit;
    }
    
    var _building_version = buffer_read(_buffer, buffer_u64);
    
    if (_building_version != 1)
    {
        __building_error("Building name mismatch (expected 1 vs. found ", _building_version, ")");
        exit;
    }
    
    var _building_found_name = buffer_read(_buffer, buffer_string);
    
    if (_building_found_name != _building_name)
    {
        __building_error("Building name mismatch (expected \"", _building_name, "\" vs. found \"", _building_found_name, "\")");
        exit;
    }
    
    var _header_string = buffer_read(_buffer, buffer_string);
    var _chunk_count = buffer_read(_buffer, buffer_u16);
    var _chunk_index = 0;
    
    repeat (_chunk_count)
    {
        var _chunk_name = buffer_read(_buffer, buffer_string);
        var _chunk_size = buffer_read(_buffer, buffer_u16);
        
        switch (_chunk_name)
        {
            case "decor":
                var _element_count = buffer_read(_buffer, buffer_u16);
                
                repeat (_element_count)
                {
                    var _x = buffer_read(_buffer, buffer_f64) + _room_x;
                    var _y = buffer_read(_buffer, buffer_f64) + _room_y;
                    var _id = buffer_read(_buffer, buffer_u16);
                    scr_place_obj_map(_id, _x, _y);
                }
                
                break;
            
            case "inst":
                var _element_count = buffer_read(_buffer, buffer_u16);
                
                repeat (_element_count)
                {
                    var _x = buffer_read(_buffer, buffer_f64) + _room_x;
                    var _y = buffer_read(_buffer, buffer_f64) + _room_y;
                    var _object_name = buffer_read(_buffer, buffer_string);
                    var _object = asset_get_index(_object_name);
                    
                    if (!object_exists(_object))
                        trace_error("\"", _object_name, "\" doesn't exist");
                    
                    instance_create_depth(_x, _y, 0, _object);
                }
                
                break;
            
            case "tele":
                var _element_count = buffer_read(_buffer, buffer_u16);
                
                repeat (_element_count)
                {
                    var _x = buffer_read(_buffer, buffer_f64) + _room_x;
                    var _y = buffer_read(_buffer, buffer_f64) + _room_y;
                    var _instance = instance_create_depth(_x, _y, 0, obj_indoor);
                    _instance.tele_x = arg3;
                    _instance.tele_y = arg4;
                    _instance = instance_create_depth(x + obj_map_generator.b_x[decor_id][image_index], y + obj_map_generator.b_y[decor_id][image_index], 0, obj_indoor);
                    _instance.tele_x = _x + 8;
                    _instance.tele_y = _y + 5;
                }
                
                break;
            
            case "tiles":
                var _tilemap_name = buffer_read(_buffer, buffer_string);
                var _tilemap_scale = buffer_read(_buffer, buffer_u8);
                var _tile_count = buffer_read(_buffer, buffer_u16);
                var _tilemap = undefined;
                
                switch (_tilemap_name)
                {
                    case "indoor_floor":
                        _tilemap = obj_map_generator.layer_tileset_floor_indoor;
                        break;
                    
                    case "indoor_wall_below":
                        _tilemap = obj_map_generator.layer_tileset_wall_below_indoor;
                        break;
                    
                    case "indoor_wall_above":
                        _tilemap = obj_map_generator.layer_tileset_wall_above_indoor;
                        break;
                    
                    case "indoor_cartelli":
                        _tilemap = obj_map_generator.layer_tileset_cartelli;
                        break;
                    
                    case "building_test":
                        _tilemap = obj_map_generator.layer_building_test;
                        break;
                    
                    case "floor_detail":
                        _tilemap = obj_map_generator.layer_floor_detail;
                        break;
                    
                    default:
                        __building_error("Unhandled tilemap layer name \"", _tilemap_name, "\"");
                        break;
                }
                
                switch (_tilemap_scale)
                {
                    case 1:
                        repeat (_tile_count)
                        {
                            var _x = buffer_read(_buffer, buffer_u16) + arg1;
                            var _y = buffer_read(_buffer, buffer_u16) + arg2;
                            var _id = buffer_read(_buffer, buffer_u32);
                            tilemap_set(_tilemap, _id, _x, _y);
                        }
                        
                        break;
                    
                    case 6:
                        repeat (_tile_count)
                        {
                            var _x = buffer_read(_buffer, buffer_u16) + _grid_x96;
                            var _y = buffer_read(_buffer, buffer_u16) + _grid_y96;
                            var _id = buffer_read(_buffer, buffer_u32);
                            tilemap_set(_tilemap, _id, _x, _y);
                        }
                        
                        break;
                    
                    default:
                        __building_error("Unhandled tile scale ", _tilemap_scale);
                        break;
                }
                
                break;
            
            case "fence grid":
                var _fence_grid = obj_map_generator.grid_fence;
                var _cell_count = buffer_read(_buffer, buffer_u16);
                
                repeat (_cell_count)
                {
                    var _x = buffer_read(_buffer, buffer_u16) + arg1;
                    var _y = buffer_read(_buffer, buffer_u16) + arg2;
                    var _id = buffer_read(_buffer, buffer_u8);
                    var _sprite = undefined;
                    
                    switch (_id)
                    {
                        case 1:
                            _sprite = s_tileset_fence_wood_big;
                            break;
                        
                        case 2:
                            _sprite = s_tileset_fence_concrete1;
                            break;
                        
                        case 3:
                            _sprite = s_tileset_fence_military;
                            break;
                        
                        default:
                            __building_error("Unhandled fence id \"", _id, "\"");
                            break;
                    }
                    
                    ds_grid_set(_fence_grid, _x, _y, _sprite);
                }
                
                break;
            
            case "grid":
                var _grid_name = buffer_read(_buffer, buffer_string);
                var _cell_count = buffer_read(_buffer, buffer_u16);
                var _grid = undefined;
                
                switch (_grid_name)
                {
                    case "floor2":
                        _grid = obj_map_generator.grid_floor2;
                        break;
                    
                    case "prevent_spawn":
                        _grid = obj_map_generator.grid_prevent_spawn;
                        break;
                    
                    default:
                        __building_error("Unhandled grid name \"", _grid_name, "\"");
                        break;
                }
                
                repeat (_cell_count)
                {
                    var _x = buffer_read(_buffer, buffer_u16) + arg1;
                    var _y = buffer_read(_buffer, buffer_u16) + arg2;
                    var _value = buffer_read(_buffer, buffer_u16);
                    ds_grid_set(_grid, _x, _y, _value);
                }
                
                break;
            
            case "grid + tiles":
                var _name = buffer_read(_buffer, buffer_string);
                var _cell_count = buffer_read(_buffer, buffer_u16);
                var _grid = undefined;
                var _tilemap = undefined;
                
                switch (_name)
                {
                    case "strada":
                        _grid = obj_map_generator.grid_strada;
                        _tilemap = obj_map_generator.layer_tileset_road;
                        break;
                    
                    case "parking":
                        _grid = obj_map_generator.grid_parking;
                        _tilemap = obj_map_generator.layer_tileset_parking;
                        break;
                    
                    case "railroad":
                        _grid = obj_map_generator.grid_train;
                        _tilemap = obj_map_generator.layer_tileset_railroad;
                        break;
                    
                    default:
                        __building_error("Unhandled grid+tiles name \"", _name, "\"");
                        break;
                }
                
                var _grid_value = buffer_read(_buffer, buffer_u16);
                
                repeat (_cell_count)
                {
                    var _x = buffer_read(_buffer, buffer_u16) + _grid_x96;
                    var _y = buffer_read(_buffer, buffer_u16) + _grid_y96;
                    var _tilemap_cell = buffer_read(_buffer, buffer_u32);
                    ds_grid_set(_grid, _x, _y, _grid_value);
                    tilemap_set(_tilemap, _tilemap_cell, _x, _y);
                }
                
                break;
            
            case "grid_map":
                var _cell_count = buffer_read(_buffer, buffer_u16);
                var _map_grid = obj_map_generator.grid_map;
                
                repeat (_cell_count)
                {
                    var _x = buffer_read(_buffer, buffer_u16) + arg1;
                    var _y = buffer_read(_buffer, buffer_u16) + arg2;
                    var _tilemap_cell = buffer_read(_buffer, buffer_u32);
                    var _value;
                    
                    switch (_tilemap_cell)
                    {
                        case 1:
                            _value = -1;
                            break;
                        
                        case 2:
                            _value = -7;
                            break;
                    }
                    
                    ds_grid_set(_map_grid, _x, _y, _value);
                }
                
                break;
            
            case "water":
                var _cell_count = buffer_read(_buffer, buffer_u16);
                var _water_grid = obj_map_generator.grid_water;
                var _map_grid = obj_map_generator.grid_map;
                var _tilemap = obj_map_generator.layer_tileset_water;
                
                repeat (_cell_count)
                {
                    var _x = buffer_read(_buffer, buffer_u16) + arg1;
                    var _y = buffer_read(_buffer, buffer_u16) + arg2;
                    var _tilemap_cell = buffer_read(_buffer, buffer_u32);
                    ds_grid_set(_water_grid, _x, _y, -1);
                    ds_grid_set(_map_grid, _x div 2, _y div 2, -1);
                    tilemap_set(_tilemap, _tilemap_cell, _x, _y);
                }
                
                break;
        }
        
        var _terminating_null = buffer_read(_buffer, buffer_u64);
        
        if (_terminating_null != 0)
            __building_error("Error in building \"", _building_name, "\": Terminating null missing for chunk (name=\"", _chunk_name, "\", index=", _chunk_index, ")");
        
        _chunk_index++;
    }
}
