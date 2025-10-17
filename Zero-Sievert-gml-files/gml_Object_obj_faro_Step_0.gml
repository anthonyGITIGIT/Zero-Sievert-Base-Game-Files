if (light_start == true)
{
    instance_create_depth(x + 8, y - 16, 0, obj_light_faro_swamp);
    light_start = false;
    light_on = true;
}
