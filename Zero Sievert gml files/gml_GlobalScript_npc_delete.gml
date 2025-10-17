function npc_delete(arg0 = -4)
{
    with (arg0)
    {
        delete_npc = true;
        instance_destroy();
    }
}
