function radiation_get_amount()
{
    if (is_in_raid() && instance_exists(obj_map_generator) && obj_map_generator.area != UnknownEnum.Value_10)
    {
        var _room_x = player_get_local().x div 8;
        var _room_y = (player_get_local().y + 8) div 8;
        return round(ds_grid_get(obj_map_generator.grid_radiation, _room_x, _room_y) ?? 0);
    }
    
    return 0;
}

enum UnknownEnum
{
    Value_10 = 10
}
