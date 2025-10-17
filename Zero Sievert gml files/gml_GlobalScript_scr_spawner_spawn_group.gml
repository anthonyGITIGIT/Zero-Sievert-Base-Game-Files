function scr_spawner_spawn_group(arg0, arg1, arg2)
{
    if (is_in_raid())
    {
        if (scr_chance(arg0))
        {
            repeat (arg2)
                instance_create_depth(x, y, 0, arg1);
        }
    }
}
