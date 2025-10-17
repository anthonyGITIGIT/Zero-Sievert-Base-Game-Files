if (ds_exists(grid_radiation, ds_type_grid))
    ds_grid_destroy(grid_radiation);

if (ds_exists(grid_tile, ds_type_grid))
    ds_grid_destroy(grid_tile);

if (ds_exists(grid_building, ds_type_grid))
    ds_grid_destroy(grid_building);

if (ds_exists(grid_floor2, ds_type_grid))
    ds_grid_destroy(grid_floor2);

if (ds_exists(grid_snow, ds_type_grid))
    ds_grid_destroy(grid_snow);

if (ds_exists(grid_strada, ds_type_grid))
    ds_grid_destroy(grid_strada);

if (ds_exists(grid_map, ds_type_grid))
    ds_grid_destroy(grid_map);

if (ds_exists(grid_map_generated, ds_type_grid))
    ds_grid_destroy(grid_map_generated);

if (ds_exists(grid_train, ds_type_grid))
    ds_grid_destroy(grid_train);

if (ds_exists(grid_parking, ds_type_grid))
    ds_grid_destroy(grid_parking);

if (ds_exists(grid_marciapiede, ds_type_grid))
    ds_grid_destroy(grid_marciapiede);

if (ds_exists(grid_water, ds_type_grid))
    ds_grid_destroy(grid_water);

if (ds_exists(grid_fence, ds_type_grid))
    ds_grid_destroy(grid_fence);

if (ds_exists(grid_indoor, ds_type_grid))
    ds_grid_destroy(grid_indoor);

if (ds_exists(grid_light_indoor, ds_type_grid))
    ds_grid_destroy(grid_light_indoor);

if (ds_exists(grid_prevent_spawn, ds_type_grid))
    ds_grid_destroy(grid_prevent_spawn);

if (surface_exists(surface_floor2))
    surface_free(surface_floor2);
