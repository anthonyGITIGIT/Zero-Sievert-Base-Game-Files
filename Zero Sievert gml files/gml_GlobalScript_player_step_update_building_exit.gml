function player_step_update_building_exit()
{
    if (!can_run_after_exit_building)
    {
        can_run_after_exit_building_timer++;
        
        if (can_run_after_exit_building_timer >= 10)
            can_run_after_exit_building = true;
    }
}
