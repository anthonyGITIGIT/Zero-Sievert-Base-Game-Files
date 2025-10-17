init_globals();
randomize();
global.map_seed = undefined ?? irandom(4294967295);
trace("Map seed chosen = ", global.map_seed, "          ", debug_get_callstack());
random_set_seed(global.map_seed);
area = db_read_ext("raid", "Map", "Map id", UnknownEnum.Value_1);
from_area = db_read_ext("raid", "Map", "From which map", 0);
lista_azioni();
scr_area_data();
audio_master_gain(0);
state = UnknownEnum.Value_0;
finish = false;
time_beetween_generation = 3;
alarm[2] = time_beetween_generation;
tempo_start = current_time;

for (var i = 0; i < UnknownEnum.Value_21; i++)
{
    tempo_generazione[i] = 0;
    tempo_gen_assoluto[i] = 0;
}

tempo_gen_name[UnknownEnum.Value_0] = "Preparing";
tempo_gen_name[UnknownEnum.Value_1] = "terrain_floor";
tempo_gen_name[UnknownEnum.Value_2] = "terrain_railroad_strada ";
tempo_gen_name[UnknownEnum.Value_3] = "terrain_floor2 ";
tempo_gen_name[UnknownEnum.Value_4] = "autotiling_road_railroad ";
tempo_gen_name[UnknownEnum.Value_5] = "fermata_treno ";
tempo_gen_name[UnknownEnum.Value_6] = "dalla_griglia_map_alla_griglia_tile ";
tempo_gen_name[UnknownEnum.Value_7] = "terrain_water ";
tempo_gen_name[UnknownEnum.Value_8] = "autotiling_terrain ";
tempo_gen_name[UnknownEnum.Value_9] = "create_solid ";
tempo_gen_name[UnknownEnum.Value_10] = "place_building ";
tempo_gen_name[UnknownEnum.Value_11] = "place_map_obj ";
tempo_gen_name[UnknownEnum.Value_12] = "place_decoration ";
tempo_gen_name[UnknownEnum.Value_13] = "aggiustamenti ";
tempo_gen_name[UnknownEnum.Value_14] = "place_quest_items ";
tempo_gen_name[UnknownEnum.Value_15] = "place_grass ";
tempo_gen_name[UnknownEnum.Value_16] = "finish ";
tempo_gen_name[UnknownEnum.Value_17] = "dynamic_npc ";
tempo_gen_name[UnknownEnum.Value_18] = "dynamic_npc_path ";
tempo_gen_name[UnknownEnum.Value_19] = "finish_2 ";
tempo_gen_name[UnknownEnum.Value_20] = "wait_player_input ";
tempo_gen_name[UnknownEnum.Value_21] = "can_play ";
debug = false;

if (debug == false)
    instance_create_depth(x, y, -9999, obj_loading_map);

var _extra = 0;

if (area == UnknownEnum.Value_6)
    _extra = 3200;

if (area == UnknownEnum.Value_8)
    _extra = 6400;

room_width = area_width[area];
map_height = area_height[area];
room_height = area_height[area] + 4800 + _extra;

for (var i = 0; i < UnknownEnum.Value_21; i++)
    bug_map[i] = 0;

bug_found = false;
grid_map_w = room_width div 32;
grid_map_h = map_height div 32;
grid_tile_w = room_width div 16;
grid_tile_h = map_height div 16;
g_indoor_w = room_width div 16;
g_indoor_h = room_height div 16;
grid_map = ds_grid_create(grid_map_w, grid_map_h);
ds_grid_clear(grid_map, -7);
grid_map_generated = ds_grid_create(grid_map_w, grid_map_h);
ds_grid_clear(grid_map_generated, -7);
grid_tile = ds_grid_create(grid_tile_w, grid_tile_h);
ds_grid_clear(grid_tile, -7);
grid_floor2 = ds_grid_create(grid_tile_w, grid_tile_h);
ds_grid_clear(grid_floor2, -1);
grid_building = ds_grid_create(grid_tile_w, grid_tile_h);
ds_grid_clear(grid_building, UnknownEnum.Value_0);
grid_fence = ds_grid_create(grid_tile_w, grid_tile_h);
ds_grid_clear(grid_fence, -1);
grid_rw = room_width div 8;
grid_rh = room_height div 8;
grid_radiation = ds_grid_create(grid_rw, grid_rh);
ds_grid_clear(grid_radiation, 0);
surf_radiation = -4;
grid_strada_w = room_width div 96;
grid_strada_h = room_height div 96;
grid_strada = ds_grid_create(grid_strada_w, grid_strada_h);
ds_grid_clear(grid_strada, -7);
grid_train_w = room_width div 96;
grid_train_h = map_height div 96;
grid_train = ds_grid_create(grid_train_w, grid_train_h);
ds_grid_clear(grid_train, -7);
grid_parking_w = room_width div 96;
grid_parking_h = room_height div 96;
grid_parking = ds_grid_create(grid_parking_w, grid_parking_h);
ds_grid_clear(grid_parking, -7);
grid_marciapiede = ds_grid_create(grid_tile_w, grid_tile_h);
ds_grid_clear(grid_marciapiede, -7);
grid_water = ds_grid_create(grid_tile_w, g_indoor_h);
ds_grid_clear(grid_water, -7);
grid_snow = ds_grid_create(grid_tile_w, grid_tile_h);
ds_grid_clear(grid_snow, false);
grid_indoor = ds_grid_create(g_indoor_w, g_indoor_h);
ds_grid_clear(grid_indoor, false);
grid_prevent_spawn = ds_grid_create(grid_tile_w, grid_tile_h);
ds_grid_clear(grid_prevent_spawn, false);
grid_light_indoor = ds_grid_create(g_indoor_w, g_indoor_h);
ds_grid_clear(grid_light_indoor, UnknownEnum.Value_1);
grid_48_x = room_width div 48;
grid_48_y = map_height div 48;
generator_startx = grid_map_w div 2;
generator_starty = grid_map_h div 2;
controllerx = generator_startx;
controllery = generator_starty;
debug_controller_x = 0;
debug_controller_y = 0;
offset_solid_dai_margini = 6;
train_start_x = 0;
train_start_y = 0;
train_stop_x = 0;
train_stop_y = 0;
zaton_stop_train_x = 0;
zaton_stop_train_y = 0;
marker_array = [];
layer_create(250, "road_layer");
var road_tileset_sprite = tile_road;

if (area == UnknownEnum.Value_7)
    road_tileset_sprite = tile_road_zaton;

if (area == UnknownEnum.Value_1)
    road_tileset_sprite = tile_road_dirt;

if (area == UnknownEnum.Value_3)
    road_tileset_sprite = tile_road_all;

if (area == UnknownEnum.Value_9)
    road_tileset_sprite = tile_road_all;

if (area == UnknownEnum.Value_6)
    road_tileset_sprite = tile_road_all;

if (area == UnknownEnum.Value_8)
    road_tileset_sprite = tile_road_all;

layer_tileset_road = layer_tilemap_create("road_layer", 0, 0, road_tileset_sprite, grid_strada_w, grid_strada_h);
layer_create(150, "railroad_layer");
layer_tileset_railroad = layer_tilemap_create("railroad_layer", 0, 0, tile_railroad_all, grid_train_w, grid_train_h);
layer_create(275, "water_layer");
layer_tileset_water = layer_tilemap_create("water_layer", 0, 0, tile_water_all, grid_tile_w, g_indoor_h);
makeshift_camp_outpost_x = 288;
makeshift_camp_outpost_y = (25 + irandom_range(-7, 7)) * 96;
makeshift_camp_outpost_w = 768;
makeshift_camp_outpost_h = 480;
swamp_crystal_pos_x = 127;
swamp_crystal_pos_y = 15;
swamp_crystal_w = 30;
swamp_exception_autotiling_water_x = 162;
swamp_exception_autotiling_water_y = 110;
var k = UnknownEnum.Value_0;
water_tile_off[k] = 0;
water_tile_off_dx[k] = 8;
water_tile_off_sx[k] = -8;
water_tile_off_su[k] = -8;
water_tile_off_giu[k] = 8;
k = UnknownEnum.Value_1;
water_tile_off[k] = 2;
water_tile_off_dx[k] = 8;
water_tile_off_sx[k] = -8;
water_tile_off_su[k] = 8;
water_tile_off_giu[k] = 8;
k = UnknownEnum.Value_2;
water_tile_off[k] = 1;
water_tile_off_dx[k] = 16;
water_tile_off_sx[k] = -16;
water_tile_off_su[k] = -16;
water_tile_off_giu[k] = 16;
k = UnknownEnum.Value_3;
water_tile_off[k] = 3;
water_tile_off_dx[k] = 8;
water_tile_off_sx[k] = -8;
water_tile_off_su[k] = -16;
water_tile_off_giu[k] = 0;
var j = 0;
water_solid_cell[j] = 12;
j++;
water_solid_cell[j] = 13;
j++;
water_solid_cell[j] = 14;
j++;
water_solid_cell[j] = 28;
j++;
water_solid_cell[j] = 30;
j++;
water_solid_cell[j] = 31;
j++;
water_solid_cell[j] = 47;
j++;
water_solid_cell[j] = 63;
j++;
water_solid_cell[j] = 62;
j++;
water_solid_cell[j] = 60;
j++;
water_solid_cell[j] = 76;
j++;
water_solid_cell[j] = 61;
j++;
water_solid_cell[j] = 77;
j++;
water_solid_cell[j] = 44;
j++;
water_solid_cell[j] = 45;
j++;
water_solid_cell[j] = 46;
j++;
water_solid_cell[j] = 78;
layer_create(225, "parking_layer");
layer_tileset_parking = layer_tilemap_create("parking_layer", 0, 0, tile_parking_all, grid_parking_w, grid_parking_h);
layer_create(375, "floor_layer");
layer_create(-50, "fence_layer");
layer_create(100, "fence_shadow_layer");
layer_create(325, "wall_swamp");
layer_create(350, "indoor_floor");
layer_create(25, "indoor_wall_below");
layer_create(-15890, "indoor_wall_above");
layer_create(-15900, "cartelli_layer");
layer_create(200, "building_test");
layer_create(50, "floor_detail");
layer_tileset_floor = layer_tilemap_create("floor_layer", 0, 0, area_tileset_floor[area], grid_tile_w, grid_tile_h);
layer_tileset_floor_indoor = layer_tilemap_create("indoor_floor", 0, 0, tile_indoor, grid_tile_w, g_indoor_h);
layer_tileset_wall_below_indoor = layer_tilemap_create("indoor_wall_below", 0, 0, tile_indoor, grid_tile_w, g_indoor_h);
layer_tileset_wall_above_indoor = layer_tilemap_create("indoor_wall_above", 0, 0, tile_indoor, grid_tile_w, g_indoor_h);
layer_tileset_cartelli = layer_tilemap_create("cartelli_layer", 0, 0, tile_indoor, grid_tile_w, g_indoor_h);
layer_tileset_cartelli = layer_tilemap_create("cartelli_layer", 0, 0, tile_indoor, grid_tile_w, g_indoor_h);
layer_building_test = layer_tilemap_create("building_test", 0, 0, tile_city_building, grid_tile_w, g_indoor_h);
layer_floor_detail = layer_tilemap_create("floor_detail", 0, 0, tile_indoor, grid_tile_w, g_indoor_h);
surface_floor2 = -4;
can_draw_surf_floor2 = false;
can_draw_surface_snow = false;
grid_map = 0;
layer_create(-15991, "layer_mouse");
layer_create(-15970, "layer_draw_item");
layer_create(-15960, "layer_draw_inv_hud");
layer_create(-15920, "layer_light");
player_create(0, 0, player_get_local_index());
instance_create_layer(0, 0, "layer_draw_inv_hud", obj_controller);
instance_create_layer(0, 0, "layer_draw_inv_hud", obj_sound_controller);
instance_create_layer(0, 0, "layer_draw_inv_hud", obj_particles_controller);
instance_create_layer(0, 0, "layer_light", obj_light_controller);
instance_create_layer(0, 0, "layer_mouse", obj_mouse);
instance_create_depth(0, 0, 0, obj_object_shadow);
instance_create_depth(0, 0, 0, obj_shader_controller);
instance_create_depth(0, 0, 0, obj_meteo_controller);
instance_create_depth(0, 0, 0, obj_snow_draw);
instance_create_depth(0, 0, 0, obj_minimap);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21
}
