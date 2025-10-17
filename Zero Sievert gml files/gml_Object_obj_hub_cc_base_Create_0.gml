scr_area_data();

if (quest_is_complete("new_arrivals"))
{
    var _x1 = x;
    var _y1 = y;
    var _x2 = _x1 + 128;
    var _y2 = _y1 + 128;
    var _off = 3;
    
    with (obj_decor_parent)
    {
        if (object_index != obj_solid)
        {
            if (x >= (_x1 - _off) && x < (_x2 + _off) && y >= (_y1 - _off) && y < (_y2 + _off))
                instance_destroy();
        }
    }
    
    building_deserialize(r_i_cc_bunker, x div 16, y div 16);
}
