function state_enemy_mutant_patrol()
{
    scr_enemy_choose_idle_or_move();
    scr_collision();
    target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
    
    if (target != -4)
    {
        hspd = 0;
        vspd = 0;
        state = npc_get_state_alert(npc_id);
    }
}
