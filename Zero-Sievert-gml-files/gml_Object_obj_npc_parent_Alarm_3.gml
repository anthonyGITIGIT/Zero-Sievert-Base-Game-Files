if (!is_in_hub() && state != "human_no_move" && state != "dummy")
{
    var _time = current_time;
    
    while (place_meeting(x, y, obj_solid) && (current_time - _time) < 5)
        x += 1;
}
