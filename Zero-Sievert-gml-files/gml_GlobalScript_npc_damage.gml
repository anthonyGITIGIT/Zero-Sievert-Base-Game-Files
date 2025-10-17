function npc_damage(arg0, arg1)
{
    if (instance_exists(arg0))
        arg0.hp -= arg1;
}
