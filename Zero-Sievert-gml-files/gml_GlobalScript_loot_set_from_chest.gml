function loot_set_from_chest(arg0, arg1 = false, arg2 = 100, arg3 = false)
{
    with (arg0)
    {
        seen = arg1;
        durability = arg2;
        created_from_player = arg3;
    }
}
