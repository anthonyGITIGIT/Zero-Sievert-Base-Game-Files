function scr_spawner_spawn(arg0, arg1)
{
    if (is_in_raid())
    {
        if (scr_chance(arg0))
            instance_create_depth(x, y, 0, arg1);
    }
}
