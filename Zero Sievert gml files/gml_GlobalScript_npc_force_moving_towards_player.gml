function npc_force_moving_towards_player()
{
    if (player_any_exists())
    {
        target = player_get_local();
        
        if (instance_exists(obj_prologue_npc))
            target = obj_prologue_npc;
        
        if (!instance_exists(target))
            target = obj_player;
        
        target_relation = UnknownEnum.Value_2;
        search_target_id = target;
        
        if (instance_exists(target))
        {
            last_seen_x = target.x;
            last_seen_y = target.y;
            move_point_x = target.x;
            move_point_y = target.y;
        }
        
        if (faction == "Mutants")
            state = "human_encounter_chase";
        else
            force_moving_towards_player = true;
    }
}

enum UnknownEnum
{
    Value_2 = 2
}
