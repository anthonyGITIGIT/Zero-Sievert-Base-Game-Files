event_inherited();

if (state == "rabbit_idle2")
{
    sprite_index = s_rabbit_idle2;
    image_speed = 0.5;
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
