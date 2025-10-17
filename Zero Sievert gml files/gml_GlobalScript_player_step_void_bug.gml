function player_step_void_bug()
{
    if (is_in_raid() && instance_exists(obj_map_generator))
    {
        if (obj_map_generator.state == UnknownEnum.Value_21)
        {
            var _offset = 1000;
            
            if (x > (room_width + _offset) || x < -_offset || y > (room_height + _offset) || y < -_offset)
            {
                if (!debug_void_extraction_create)
                {
                    debug_void_extraction_create = true;
                    instance_create_depth(x, y, 0, obj_extraction_point);
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_21 = 21
}
