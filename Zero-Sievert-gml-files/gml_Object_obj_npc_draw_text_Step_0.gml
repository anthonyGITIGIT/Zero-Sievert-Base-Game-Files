if (instance_exists(id_npc))
{
    x = id_npc.x;
    y = id_npc.y;
    
    if (global.t_npc_needs_sight[text_id])
    {
        if (instance_exists(player_get_local()))
        {
            if (!collision_line(x, y, obj_player.x, obj_player.y, obj_solid, false, false))
                visible = true;
            else
                visible = false;
        }
    }
}
else
{
    instance_destroy();
}
