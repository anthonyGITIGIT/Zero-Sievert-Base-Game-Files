if (state == "crow_idle2")
{
    sprite_index = s_crow_idle2;
    image_speed = 0.5;
}
else if (state == "crow_escape")
{
    sprite_index = s_crow_fly;
    image_speed = 2;
}
else if (state == "crow_eat")
{
    sprite_index = s_crow_eat;
    image_speed = 0.5;
}
else if (state == "crow_move_to_target")
{
    sprite_index = s_crow_fly;
    image_speed = 2;
}
else
{
    if (xprevious != x || yprevious != y)
    {
        sprite_index = sprite_move;
        image_speed = npc_get_ims_move(npc_id);
    }
    
    if (xprevious == x && yprevious == y)
    {
        sprite_index = sprite_idle;
        image_speed = npc_get_ims_idle(npc_id);
    }
}
