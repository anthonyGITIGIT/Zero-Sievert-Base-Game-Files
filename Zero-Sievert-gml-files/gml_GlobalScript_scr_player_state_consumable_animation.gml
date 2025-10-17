function scr_player_state_consumable_animation()
{
    if (aiming)
    {
        aiming = false;
        
        with (obj_mouse)
            visible = true;
    }
    
    if (arms_holder != undefined)
    {
        var _can_move = true;
        var _speed_multi = 1;
        
        if (item_fits_category(arms_holder.item_id, "medication"))
        {
            _can_move = item_med_get_can_move(arms_holder.item_id);
            _speed_multi = item_med_get_speed_multiplier(arms_holder.item_id);
        }
        
        scr_player_movement(_speed_multi, _can_move, false);
    }
    
    scr_player_all_quest_triggers();
}
