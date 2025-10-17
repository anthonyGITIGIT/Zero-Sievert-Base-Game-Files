function scr_animation_end(arg0)
{
    var _s = arg0;
    var _end = false;
    
    if (ani_end == false)
    {
        if ((image_index + image_speed) >= image_number)
        {
            ani_end = true;
            _end = true;
        }
    }
    
    if (image_index > 0 && image_index < (image_number - 1))
        ani_end = false;
    
    return _end;
}
