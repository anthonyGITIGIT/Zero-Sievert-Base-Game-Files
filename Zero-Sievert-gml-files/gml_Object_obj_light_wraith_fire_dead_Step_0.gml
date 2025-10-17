if (start == false)
    event_inherited();

if (start == true)
{
    scale -= (flickering_amount * 1);
    scale = clamp(scale, 0, scale_start + flickering_range);
}
