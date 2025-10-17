function building_deserialize_indoor(arg0, arg1, arg2, arg3 = 17, arg4, arg5 = 0, arg6 = 0, arg7 = undefined, arg8 = undefined)
{
    var _o = obj_map_generator;
    building_deserialize(arg0, arg1, arg2, arg7, arg8);
    ds_grid_set_region(_o.grid_indoor, arg1 - arg3, arg2 - arg3, (arg1 + arg3 + arg5) - 1, (arg2 + arg3 + arg6) - 1, true);
    ds_grid_set_region(_o.grid_light_indoor, arg1 - arg3, arg2 - arg3, (arg1 + arg3 + arg5) - 1, (arg2 + arg3 + arg6) - 1, arg4);
}
